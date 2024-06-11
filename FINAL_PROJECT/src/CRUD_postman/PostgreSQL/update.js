const express = require("express");
const { Pool } = require("pg");
const app = express();

app.use(express.json());

const pool = new Pool({
    host: "localhost",
    user: "your_user",
    password: "your_password",
    database: "Nully"
});

// Update user
app.put("/update/user/:id", async (req, res) => {
    const userId = req.params.id;
    const { first_name, last_name, username, email_address, password } = req.body;

    const query = `
        UPDATE users
        SET first_name = $1, last_name = $2, username = $3, email_address = $4, password = $5
        WHERE id = $6
    `;
    try {
        const result = await pool.query(query, [first_name, last_name, username, email_address, password, userId]);
        res.send(result);
    } catch (err) {
        console.error(err);
        res.status(500).send(err);
    }
});

// Update board
app.put("/update/board/:id", async (req, res) => {
    const boardId = req.params.id;
    const { user_id, name, is_public } = req.body;

    const query = `
        UPDATE boards
        SET user_id = $1, name = $2, is_public = $3
        WHERE id = $4
    `;
    try {
        const result = await pool.query(query, [user_id, name, is_public, boardId]);
        res.send(result);
    } catch (err) {
        console.error(err);
        res.status(500).send(err);
    }
});

// Update list
app.put("/update/list/:id", async (req, res) => {
    const listId = req.params.id;
    const { board_id, name, position } = req.body;

    const query = `
        UPDATE lists
        SET board_id = $1, name = $2, position = $3
        WHERE id = $4
    `;
    try {
        const result = await pool.query(query, [board_id, name, position, listId]);
        res.send(result);
    } catch (err) {
        console.error(err);
        res.status(500).send(err);
    }
});

// Update card
app.put("/update/card/:id", async (req, res) => {
    const cardId = req.params.id;
    const { list_id, name, description, is_active, due_date, reminder_date } = req.body;

    const query = `
        UPDATE cards
        SET list_id = $1, name = $2, description = $3, is_active = $4, due_date = $5, reminder_date = $6
        WHERE id = $7
    `;
    try {
        const result = await pool.query(query, [list_id, name, description, is_active, due_date, reminder_date, cardId]);
        res.send(result);
    } catch (err) {
        console.error(err);
        res.status(500).send(err);
    }
});

app.listen(3000, (err) => {
    if (err) {
        console.error(err);
    } else {
        console.log("Server is running on port 3000");
    }
});
