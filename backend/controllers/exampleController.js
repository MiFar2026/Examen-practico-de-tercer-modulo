const { getAllEvents } = require("../model/collections/eventModel");

async function showEvents(req, res) {

    try {
        const events = await getAllEvents();
        res.json(events);
    }

    catch (error) {
        res.status(500).json({
            message: error.message
        });
    }

    finally {
        console.log("showEvents finished.");
    }
}

module.exports = {
    showEvents
};