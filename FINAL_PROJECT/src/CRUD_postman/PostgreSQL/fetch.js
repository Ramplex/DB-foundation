const express = require("express");
const { Pool } = require("pg");
const app = express();

const pool = new Pool({
    host: "localhost",
    user: "your_postgres_user",
    password: "your_postgres_password",
    database: "Nully",
    port: 5432, 
});

pool.connect((err) => {
    if (err) {
        console.error("Error connecting to the database:", err);
    } else {
        console.log("connected to the database");
    }
});

app.get("/fetch", async (req, res) => {
    try {
        const result = await pool.query("SELECT * FROM users WHERE username = 'madisony';");
        console.log(result.rows);
        res.json(result.rows);
    } catch (err) {
        console.error(err);
        res.status(500).send("Error fetching data");
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
