const db = require("../../db");
function getAllEvents() {

    return new Promise((resolve, reject) => {
        db.query(
            "SELECT * FROM Events",
            (err, rows) => {
                if (err) {
                    reject(err);
                } else {
                    resolve(rows);
                }
            }
        );
    });
}

function getEventById(id) {
    return new Promise((resolve, reject) => {
        db.query(
            "SELECT * FROM Events WHERE EventID = ?",
            [id],
            (err, rows) => {
                if (err) {
                    reject(err);
                } else {
                    resolve(rows);
                }
            }
        );
    });
}

function updateEvent(id, capacity) {
    return new Promise((resolve, reject) => {
        db.query(
            "UPDATE Events SET Capacity = ? WHERE EventID = ?",
            [capacity, id],
            (err, result) => {
                if (err) {
                    reject(err);
                } else {
                    resolve(result);
                }
            }
        );
    });
}

function deleteEvent(id) {
    return new Promise((resolve, reject) => {
        db.query(
            "DELETE FROM Events WHERE EventID = ?",
            [id],
            (err, result) => {
                if (err) {
                    reject(err);
                } else {
                    resolve(result);
                }
            }
        );
    });
}

module.exports = {

    getAllEvents,
    getEventById,
    updateEvent,
    deleteEvent

};