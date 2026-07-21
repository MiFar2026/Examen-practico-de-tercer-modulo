const app = require("./app");

const PORT = process.env.PORT || 5777 || 5555;

app.listen(PORT, () => {
    console.log(`Server started on port ${PORT}`);
});