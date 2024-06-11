var express = require("express");
var mysql = require("mysql");
var app = express();

app.use(express.json());

const con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "a",
    database: "Nully"
});

con.connect((err) => {
    if (err) {
        console.error(err);
    } else {
        console.log("Connected to the database");
    }
});

// Update user
app.put("/update/user/:id", (req, res) => {
    const userId = req.params.id;
    const { first_name, last_name, username, email_address, password } = req.body;

    const query = `
        UPDATE users
        SET first_name = ?, last_name = ?, username = ?, email_address = ?, password = ?
        WHERE id = UUID_TO_BIN(?)
    `;
    con.query(query, [first_name, last_name, username, email_address, password, userId], (err, result) => {
        if (err) {
            console.error(err);
            res.status(500).send(err);
        } else {
            res.send(result);
        }
    });
});

// Update board
app.put("/update/board/:id", (req, res) => {
    const boardId = req.params.id;
    const { user_id, name, is_public } = req.body;

    const query = `
        UPDATE boards
        SET user_id = UUID_TO_BIN(?), name = ?, is_public = ?
        WHERE id = UUID_TO_BIN(?)
    `;
    con.query(query, [user_id, name, is_public, boardId], (err, result) => {
        if (err) {
            console.error(err);
            res.status(500).send(err);
        } else {
            res.send(result);
        }
    });
});

// Update list
app.put("/update/list/:id", (req, res) => {
    const listId = req.params.id;
    const { board_id, name, position } = req.body;

    const query = `
        UPDATE lists
        SET board_id = UUID_TO_BIN(?), name = ?, position = ?
        WHERE id = UUID_TO_BIN(?)
    `;
    con.query(query, [board_id, name, position, listId], (err, result) => {
        if (err) {
            console.error(err);
            res.status(500).send(err);
        } else {
            res.send(result);
        }
    });
});

// Update card
app.put("/update/card/:id", (req, res) => {
    const cardId = req.params.id;
    const { list_id, name, description, is_active, due_date, reminder_date } = req.body;

    const query = `
        UPDATE cards
        SET list_id = UUID_TO_BIN(?), name = ?, description = ?, is_active = ?, due_date = ?, reminder_date = ?
        WHERE id = UUID_TO_BIN(?)
    `;
    con.query(query, [list_id, name, description, is_active, due_date, reminder_date, cardId], (err, result) => {
        if (err) {
            console.error(err);
            res.status(500).send(err);
        } else {
            res.send(result);
        }
    });
});

app.listen(3000, (err) => {
    if (err) {
        console.error(err);
    } else {
        console.log("Server is running on port 3000");
    }
});
