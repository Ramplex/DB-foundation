const express = require("express");
const { Pool } = require("pg");
const app = express();

app.use(express.json());

const pool = new Pool({
    host: "localhost",
    user: "postgres", 
    password: "a",     
    database: "Nully",
    port: 5432
});

pool.connect((err) => {
    if (err) {
        console.log("Error connecting to the database:", err);
    } else {
        console.log("Connected to the database");
    }
});

// General function to delete by id
const deleteById = (tableName, idField, req, res) => {
    const id = req.params.id;
    pool.query(`DELETE FROM ${tableName} WHERE ${idField} = $1`, [id], (err, result) => {
        if (err) {
            console.log(`Error deleting from ${tableName}:`, err);
            res.status(500).send({ error: `Error deleting from ${tableName}` });
        } else {
            res.status(200).send({ message: `Deleted successfully from ${tableName}` });
        }
    });
};


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

app.delete('/delete/board_user/:board_id/:user_id', (req, res) => {
    const { board_id, user_id } = req.params;
    pool.query('DELETE FROM board_user WHERE board_id = $1 AND user_id = $2', [board_id, user_id], (err, result) => {
        if (err) {
            console.log('Error deleting from board_user:', err);
            res.status(500).send({ error: 'Error deleting from board_user' });
        } else {
            res.status(200).send({ message: 'Deleted successfully from board_user' });
        }
    });
});

app.delete('/delete/card_user/:card_id/:user_id', (req, res) => {
    const { card_id, user_id } = req.params;
    pool.query('DELETE FROM card_user WHERE card_id = $1 AND user_id = $2', [card_id, user_id], (err, result) => {
        if (err) {
            console.log('Error deleting from card_user:', err);
            res.status(500).send({ error: 'Error deleting from card_user' });
        } else {
            res.status(200).send({ message: 'Deleted successfully from card_user' });
        }
    });
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

app.delete('/delete/card_label/:label_id/:card_id', (req, res) => {
    const { label_id, card_id } = req.params;
    pool.query('DELETE FROM card_labels WHERE label_id = $1 AND card_id = $2', [label_id, card_id], (err, result) => {
        if (err) {
            console.log('Error deleting from card_labels:', err);
            res.status(500).send({ error: 'Error deleting from card_labels' });
        } else {
            res.status(200).send({ message: 'Deleted successfully from card_labels' });
        }
    });
});

app.delete('/delete/attachment/:id', (req, res) => {
    deleteById('attachments', 'id', req, res);
});

app.listen(3000, () => {
    console.log("Server is running on port 3000");
});
