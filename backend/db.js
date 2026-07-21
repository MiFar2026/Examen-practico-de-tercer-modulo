const mysql = require("mysql2");

const connection = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "root",
    database: "HamedanBookEventsDB"
});

connection.connect((error) => {

    if (error) {

        console.log(error);
        return;

    }

    console.log("MySQL Connected!");

});

module.exports = connection;