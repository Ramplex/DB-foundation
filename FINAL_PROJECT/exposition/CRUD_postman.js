const express = require("express");
const mysql = require("mysql2/promise"); // Cambiado a mysql2/promise para usar Promesas
const crypto = require("crypto");
const bcrypt = require("bcrypt");

const app = express();
app.use(express.json());

const dbConfig = {
    host: "localhost",
    user: "root",
    password: "a",
    database: "Nully"
};

let connection;

async function connectToDatabase() {
    try {
        connection = await mysql.createConnection(dbConfig);
        console.log("Connected to the database");
    } catch (err) {
        console.error("Error connecting to the database:", err);
    }
}

connectToDatabase();

const executeQueries = async (queries) => {
    return Promise.all(queries.map(q => connection.execute(q.query, q.values)));
};

// Endpoints para registro y obtención de datos
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

    try {
        await connection.beginTransaction();

        // Insert users
        const userQueries = users.map(user => {
            const id = crypto.randomUUID();
            userIds[user.username] = id;
            const hashedPassword = bcrypt.hashSync(user.password, 10);
            return {
                query: "INSERT INTO users (id, first_name, last_name, username, email_address, password) VALUES (UUID_TO_BIN(?), ?, ?, ?, ?, ?)",
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
                query: "INSERT INTO boards (id, user_id, name, is_public) VALUES (UUID_TO_BIN(?), UUID_TO_BIN(?), ?, ?)",
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
                query: "INSERT INTO lists (id, board_id, name, position) VALUES (UUID_TO_BIN(?), UUID_TO_BIN(?), ?, ?)",
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
                query: "INSERT INTO cards (id, list_id, name, description, due_date, reminder_date) VALUES (UUID_TO_BIN(?), UUID_TO_BIN(?), ?, ?, ?, ?)",
                values: [id, list_id, card.name, card.description, card.due_date, card.reminder_date]
            };
        });
        await executeQueries(cardQueries);

        // Insert board_user relationships
        const boardUserQueries = board_users.map(relation => {
            const board_id = boardIds[relation.board_name];
            const user_id = userIds[relation.username];
            return {
                query: "INSERT INTO board_user (board_id, user_id) VALUES (UUID_TO_BIN(?), UUID_TO_BIN(?))",
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
                query: "INSERT INTO comments (id, card_id, user_id, content) VALUES (UUID_TO_BIN(?), UUID_TO_BIN(?), UUID_TO_BIN(?), ?)",
                values: [id, card_id, user_id, comment.content]
            };
        });
        await executeQueries(commentQueries);

        // Insert checklists
        const checklistQueries = checklists.map(checklist => {
            const id = crypto.randomUUID();
            const card_id = cardIds[checklist.card_name];
            return {
                query: "INSERT INTO checklists (id, card_id, name, is_checked, position) VALUES (UUID_TO_BIN(?), UUID_TO_BIN(?), ?, ?, ?)",
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
                query: "INSERT INTO card_activity (id, card_id, user_id, activity) VALUES (UUID_TO_BIN(?), UUID_TO_BIN(?), UUID_TO_BIN(?), ?)",
                values: [id, card_id, user_id, activity.activity]
            };
        });
        await executeQueries(cardActivityQueries);

        // Insert labels
        const labelQueries = labels.map(label => {
            const id = crypto.randomUUID();
            labelIds[label.name] = id;
            return {
                query: "INSERT INTO core_labels (id, name, color) VALUES (UUID_TO_BIN(?), ?, ?)",
                values: [id, label.name, label.color]
            };
        });
        await executeQueries(labelQueries);

        // Insert board_labels
        const boardLabelQueries = board_labels.map(board_label => {
            const id = crypto.randomUUID();
            const board_id = boardIds[board_label.board_name];
            return {
                query: "INSERT INTO board_labels (id, board_id, name, color) VALUES (UUID_TO_BIN(?), UUID_TO_BIN(?), ?, ?)",
                values: [id, board_id, board_label.name, board_label.color]
            };
        });
        await executeQueries(boardLabelQueries);

        // Insert card_labels
        const cardLabelQueries = card_labels.map(card_label => {
            const label_id = labelIds[card_label.label_name];
            const card_id = cardIds[card_label.card_name];
            return {
                query: "INSERT INTO card_labels (label_id, card_id) VALUES (UUID_TO_BIN(?), UUID_TO_BIN(?))",
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
                query: "INSERT INTO attachments (id, card_id, user_id, upload_date, filename, location) VALUES (UUID_TO_BIN(?), UUID_TO_BIN(?), UUID_TO_BIN(?), ?, ?, ?)",
                values: [id, card_id, user_id, attachment.upload_date, attachment.filename, attachment.location]
            };
        });
        await executeQueries(attachmentQueries);

        await connection.commit();
        res.send({ success: true });
    } catch (err) {
        console.error("Error:", err);
        await connection.rollback();
        res.status(500).send({ error: "Error inserting data" });
    }
});

app.get("/user", async (req, res) => {
    try {
        const [result] = await connection.execute("SELECT BIN_TO_UUID(id) AS 'UUID', first_name, last_name, username FROM users WHERE username = 'luppus';");
        console.log(result);
        res.json(result);
    } catch (err) {
        console.error(err);
        res.status(500).send("Error fetching data");
    }
});

app.get("/board", async (req, res) => {
    try {
        const [result] = await connection.execute("SELECT BIN_TO_UUID(boards.id) AS 'Board UUID', users.first_name, users.last_name, users.username FROM boards INNER JOIN users ON boards.user_id = users.id WHERE users.username = 'luppus'");
        console.log(result);
        res.json(result);
    } catch (err) {
        console.error(err);
        res.status(500).send("Error fetching data from board table");
    }
});

app.get("/list", async (req, res) => {
    try {
        const [result] = await connection.execute("SELECT BIN_TO_UUID(lists.id) AS 'List UUID', users.first_name, users.last_name, users.username FROM lists INNER JOIN boards ON lists.board_id = boards.id INNER JOIN users ON boards.user_id = users.id WHERE users.username = 'luppus'");
        console.log(result);
        res.json(result);
    } catch (err) {
        console.error(err);
        res.status(500).send("Error fetching data from list table");
    }
});

app.get("/card", async (req, res) => {
    try {
        const [result] = await connection.execute("SELECT BIN_TO_UUID(cards.id) AS 'Card UUID', users.first_name, users.last_name, users.username FROM cards INNER JOIN lists ON cards.list_id = lists.id INNER JOIN boards ON lists.board_id = boards.id INNER JOIN users ON boards.user_id = users.id WHERE users.username = 'luppus'");
        console.log(result);
        res.json(result);
    } catch (err) {
        console.error(err);
        res.status(500).send("Error fetching data from card table");
    }
});

// General function to delete by id
const deleteById = async (tableName, idField, req, res) => {
    const id = req.params.id;
    try {
        await connection.execute(`DELETE FROM ${tableName} WHERE ${idField} = UNHEX(?)`, [id.replace(/-/g, '')]);
        res.status(200).send({ message: `Deleted successfully from ${tableName}` });
    } catch (err) {
        console.error(`Error deleting from ${tableName}:`, err);
        res.status(500).send({ error: `Error deleting from ${tableName}` });
    }
};

// Rutas para eliminar registros
app.delete('/delete/user/:id', (req, res) => {
    deleteById('users', 'id', req, res);
});

app.delete('/delete/board/:id', (req, res) => {
    deleteById('boards', 'id', req, res);
});

app.delete('/delete/list/:id', (req, res) => {
    deleteById('lists', 'id', req, res);
});

app.delete('/delete/card/:id', (req, res) => {
    deleteById('cards', 'id', req, res);
});

app.delete('/delete/comment/:id', (req, res) => {
    deleteById('comments', 'id', req, res);
});

app.delete('/delete/checklist/:id', (req, res) => {
    deleteById('checklists', 'id', req, res);
});

app.delete('/delete/board_user/:board_id/:user_id', async (req, res) => {
    const { board_id, user_id } = req.params;
    try {
        await connection.execute('DELETE FROM board_user WHERE board_id = UNHEX(?) AND user_id = UNHEX(?)', [board_id.replace(/-/g, ''), user_id.replace(/-/g, '')]);
        res.status(200).send({ message: 'Deleted successfully from board_user' });
    } catch (err) {
        console.error('Error deleting from board_user:', err);
        res.status(500).send({ error: 'Error deleting from board_user' });
    }
});

app.delete('/delete/card_user/:card_id/:user_id', async (req, res) => {
    const { card_id, user_id } = req.params;
    try {
        await connection.execute('DELETE FROM card_user WHERE card_id = UNHEX(?) AND user_id = UNHEX(?)', [card_id.replace(/-/g, ''), user_id.replace(/-/g, '')]);
        res.status(200).send({ message: 'Deleted successfully from card_user' });
    } catch (err) {
        console.error('Error deleting from card_user:', err);
        res.status(500).send({ error: 'Error deleting from card_user' });
    }
});

app.delete('/delete/card_activity/:id', (req, res) => {
    deleteById('card_activity', 'id', req, res);
});

app.delete('/delete/core_label/:id', (req, res) => {
    deleteById('core_labels', 'id', req, res);
});

app.delete('/delete/board_label/:id', (req, res) => {
    deleteById('board_labels', 'id', req, res);
});

app.delete('/delete/card_label/:label_id/:card_id', async (req, res) => {
    const { label_id, card_id } = req.params;
    try {
        await connection.execute('DELETE FROM card_labels WHERE label_id = UNHEX(?) AND card_id = UNHEX(?)', [label_id.replace(/-/g, ''), card_id.replace(/-/g, '')]);
        res.status(200).send({ message: 'Deleted successfully from card_labels' });
    } catch (err) {
        console.error('Error deleting from card_labels:', err);
        res.status(500).send({ error: 'Error deleting from card_labels' });
    }
});

app.delete('/delete/attachment/:id', (req, res) => {
    deleteById('attachments', 'id', req, res);
});

// Rutas para actualizar registros
app.put("/update/user/:id", async (req, res) => {
    const userId = req.params.id;
    const { first_name, last_name, username, email_address, password } = req.body;

    const query = `
        UPDATE users
        SET first_name = ?, last_name = ?, username = ?, email_address = ?, password = ?
        WHERE id = UUID_TO_BIN(?)
    `;
    try {
        await connection.execute(query, [first_name, last_name, username, email_address, password, userId]);
        res.send({ message: "User updated successfully" });
    } catch (err) {
        console.error(err);
        res.status(500).send(err);
    }
});

app.put("/update/board/:id", async (req, res) => {
    const boardId = req.params.id;
    const { user_id, name, is_public } = req.body;

    const query = `
        UPDATE boards
        SET user_id = UUID_TO_BIN(?), name = ?, is_public = ?
        WHERE id = UUID_TO_BIN(?)
    `;
    try {
        await connection.execute(query, [user_id, name, is_public, boardId]);
        res.send({ message: "Board updated successfully" });
    } catch (err) {
        console.error(err);
        res.status(500).send(err);
    }
});

app.put("/update/list/:id", async (req, res) => {
    const listId = req.params.id;
    const { board_id, name, position } = req.body;

    const query = `
        UPDATE lists
        SET board_id = UUID_TO_BIN(?), name = ?, position = ?
        WHERE id = UUID_TO_BIN(?)
    `;
    try {
        await connection.execute(query, [board_id, name, position, listId]);
        res.send({ message: "List updated successfully" });
    } catch (err) {
        console.error(err);
        res.status(500).send(err);
    }
});

app.put("/update/card/:id", async (req, res) => {
    const cardId = req.params.id;
    const { list_id, name, description, is_active, due_date, reminder_date } = req.body;

    const query = `
        UPDATE cards
        SET list_id = UUID_TO_BIN(?), name = ?, description = ?, is_active = ?, due_date = ?, reminder_date = ?
        WHERE id = UUID_TO_BIN(?)
    `;
    try {
        await connection.execute(query, [list_id, name, description, is_active, due_date, reminder_date, cardId]);
        res.send({ message: "Card updated successfully" });
    } catch (err) {
        console.error(err);
        res.status(500).send(err);
    }
});

app.listen(3000, () => {
    console.log("Server is running on port 3000");
});
