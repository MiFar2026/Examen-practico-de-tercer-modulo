const { body } = require("express-validator");

const eventValidator = [
    body("EventTitle")
        .notEmpty()
        .withMessage("Event title is required"),
    body("Capacity")
        .isInt({ min: 1 })
        .withMessage("Capacity must be a number")
];

module.exports = eventValidator;