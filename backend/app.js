const express = require("express");
const app = express();
const eventRouter = require("./routes/event");

app.use(express.json());
app.get("/", (req, res) => {

    res.send("Welcome to Hamedan Book Events!");
});

app.get("/about", (req, res) => {
    res.send("This project manages cultural book events in Hamedan.");
});

app.use("/event", eventRouter);

module.exports = app;