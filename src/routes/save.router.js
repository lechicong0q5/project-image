import express from "express";
import SaveController from "../controllers/save.controller.js";


const SaveRouter = express.Router();

SaveRouter.get(`/find-save`, SaveController.FindSave);


export default SaveRouter;