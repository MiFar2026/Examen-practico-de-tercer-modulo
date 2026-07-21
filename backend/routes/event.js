const express = require("express");
const router = express.Router();
const { showEvents } = require("../controllers/exampleController");
router.get("/", showEvents);
module.exports = router;

const {
    getAllEvents,
    getEventById,
    updateEvent,
    deleteEvent
} = require("../model/collections/eventModel");

router.get("/", async (req, res) => {

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
        console.log("GET /event finished");
    }
});
router.get("/:id", async (req, res) => {

    try {
        const event = await getEventById(req.params.id);
        res.json(event);
    }
    catch (error) {
        res.status(500).json({
            message: error.message
        });
    }
    finally {
        console.log("GET BY ID finished");
    }
});

router.put("/:id", async (req, res) => {
    try {
        await updateEvent(
            req.params.id,
            req.body.Capacity
        );
        res.json({
            message: "Event updated"
        });
    }
    catch (error) {
        res.status(500).json({
            message: error.message
        });
    }
    finally {
        console.log("PUT finished");
    }
});
router.delete("/:id", async (req, res) => {

    try {
        await deleteEvent(req.params.id);
        res.json({
            message: "Event deleted"
        });
    }

    catch (error) {
        res.status(500).json({
            message: error.message
        });

    }

    finally {
        console.log("DELETE finished");
    }

});
module.exports = router;