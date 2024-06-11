const express = require("express");
const { Client } = require("pg");
const crypto = require("crypto");
const bcrypt = require("bcrypt");
const { promisify } = require("util");

const app = express();
app.use(express.json());

const client = new Client({
    host: "localhost",
    user: "postgres",
    password: "your_password",
    database: "Nully"
});

client.connect((err) => {
    if (err) {
        console.error("Connection error", err.stack);
    } else {
        console.log("connected");
    }
});

const query = promisify(client.query).bind(client);

const executeQueries = async (queries) => {
    return Promise.all(queries.map(q => query(q.query, q.values)));
};

app.post('/register', async (req, res) => {
    const {
        users, boards, lists, cards, board_users, comments,
        checklists, card_activities, labels, board_labels,
        card_labels, attachments
    } = req.body;

    const userIds = {};
    const boardIds = {};
    const listIds = {};
    const cardIds = {};
    const labelIds = {};

    const clientConnection = await new Promise((resolve, reject) => {
        client.query('BEGIN', err => {
            if (err) reject(err);
            else resolve(client);
        });
    });

    try {
        // Insert users
        const userQueries = users.map(user => {
            const id = crypto.randomUUID();
            userIds[user.username] = id;
            const hashedPassword = bcrypt.hashSync(user.password, 10);
            return {
                query: "INSERT INTO users (id, first_name, last_name, username, email_address, password) VALUES ($1, $2, $3, $4, $5, $6)",
                values: [id, user.first_name, user.last_name, user.username, user.email_address, hashedPassword]
            };
        });
        await executeQueries(userQueries);

        // Insert boards
        const boardQueries = boards.map(board => {
            const id = crypto.randomUUID();
            boardIds[board.name] = id;
            const user_id = userIds[board.username];
            return {
                query: "INSERT INTO boards (id, user_id, name, is_public) VALUES ($1, $2, $3, $4)",
                values: [id, user_id, board.name, board.is_public]
            };
        });
        await executeQueries(boardQueries);

        // Insert lists
        const listQueries = lists.map(list => {
            const id = crypto.randomUUID();
            listIds[list.name] = id;
            const board_id = boardIds[list.board_name];
            return {
                query: "INSERT INTO lists (id, board_id, name, position) VALUES ($1, $2, $3, $4)",
                values: [id, board_id, list.name, list.position]
            };
        });
        await executeQueries(listQueries);

        // Insert cards
        const cardQueries = cards.map(card => {
            const id = crypto.randomUUID();
            cardIds[card.name] = id;
            const list_id = listIds[card.list_name];
            return {
                query: "INSERT INTO cards (id, list_id, name, description, due_date, reminder_date) VALUES ($1, $2, $3, $4, $5, $6)",
                values: [id, list_id, card.name, card.description, card.due_date, card.reminder_date]
            };
        });
        await executeQueries(cardQueries);

        // Insert board_user relationships
        const boardUserQueries = board_users.map(relation => {
            const board_id = boardIds[relation.board_name];
            const user_id = userIds[relation.username];
            return {
                query: "INSERT INTO board_user (board_id, user_id) VALUES ($1, $2)",
                values: [board_id, user_id]
            };
        });
        await executeQueries(boardUserQueries);

        // Insert comments
        const commentQueries = comments.map(comment => {
            const id = crypto.randomUUID();
            const card_id = cardIds[comment.card_name];
            const user_id = userIds[comment.username];
            return {
                query: "INSERT INTO comments (id, card_id, user_id, content) VALUES ($1, $2, $3, $4)",
                values: [id, card_id, user_id, comment.content]
            };
        });
        await executeQueries(commentQueries);

        // Insert checklists
        const checklistQueries = checklists.map(checklist => {
            const id = crypto.randomUUID();
            const card_id = cardIds[checklist.card_name];
            return {
                query: "INSERT INTO checklists (id, card_id, name, is_checked, position) VALUES ($1, $2, $3, $4, $5)",
                values: [id, card_id, checklist.name, checklist.is_checked, checklist.position]
            };
        });
        await executeQueries(checklistQueries);

        // Insert card activities
        const cardActivityQueries = card_activities.map(activity => {
            const id = crypto.randomUUID();
            const card_id = cardIds[activity.card_name];
            const user_id = userIds[activity.username];
            return {
                query: "INSERT INTO card_activity (id, card_id, user_id, activity) VALUES ($1, $2, $3, $4)",
                values: [id, card_id, user_id, activity.activity]
            };
        });
        await executeQueries(cardActivityQueries);

        // Insert labels
        const labelQueries = labels.map(label => {
            const id = crypto.randomUUID();
            labelIds[label.name] = id;
            return {
                query: "INSERT INTO core_labels (id, name, color) VALUES ($1, $2, $3)",
                values: [id, label.name, label.color]
            };
        });
        await executeQueries(labelQueries);

        // Insert board_labels
        const boardLabelQueries = board_labels.map(board_label => {
            const id = crypto.randomUUID();
            const board_id = boardIds[board_label.board_name];
            return {
                query: "INSERT INTO board_labels (id, board_id, name, color) VALUES ($1, $2, $3, $4)",
                values: [id, board_id, board_label.name, board_label.color]
            };
        });
        await executeQueries(boardLabelQueries);

        // Insert card_labels
        const cardLabelQueries = card_labels.map(card_label => {
            const label_id = labelIds[card_label.label_name];
            const card_id = cardIds[card_label.card_name];
            return {
                query: "INSERT INTO card_labels (label_id, card_id) VALUES ($1, $2)",
                values: [label_id, card_id]
            };
        });
        await executeQueries(cardLabelQueries);

        // Insert attachments
        const attachmentQueries = attachments.map(attachment => {
            const id = crypto.randomUUID();
            const card_id = cardIds[attachment.card_name];
            const user_id = userIds[attachment.username];
            return {
                query: "INSERT INTO attachments (id, card_id, user_id, upload_date, filename, location) VALUES ($1, $2, $3, $4, $5, $6)",
                values: [id, card_id, user_id, attachment.upload_date, attachment.filename, attachment.location]
            };
        });
        await executeQueries(attachmentQueries);

        await clientConnection.query('COMMIT');
        res.send({ success: true });
    } catch (err) {
        console.error("Error:", err);
        await clientConnection.query('ROLLBACK');
        res.status(500).send({ error: "Error while inserting data" });
    }
});

const PORT = 3000;
app.listen(PORT, (err) => {
    if (err) {
        console.error("Error starting the server:", err);
    } else {
        console.log(`Server running on port ${PORT}`);
    }
});

