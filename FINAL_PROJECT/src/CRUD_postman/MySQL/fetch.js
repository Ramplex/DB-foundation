const express=require("express");
const mysql=require("mysql");
const app=express();

const con=mysql.createConnection({
    host:"localhost",
    user:"root",
    password:"a",
    database:"Nully"
});

con.connect((err)=> {
    if(err)
    {
        console.error("Error connecting to the database:", err);
    }else{
        console.log("connected to the database");
    }
});

app.get("/fetch",(req,res)=>{
    con.query("SELECT * FROM users WHERE username = 'luppus';",function(err,result,fields){
        if(err)
        {
            console.log(err)
        }else{
            var r=JSON.parse(JSON.stringify(result))
            console.log(r)
        }
    });
})

app.listen(3000,(err)=>{
    if(err)
    {
        console.error("Error starting the server:", err);
    }else{
        console.log("Server running on port 3000");
    }
})

//50dcd46d-274d-469c-8c2e-ddb65bd3839d
//204e78b3-2455-46a9-abec-27ec3e58c299
