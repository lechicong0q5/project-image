import express from "express";
import imageController from "../controllers/image.controller.js";


const imageRouter = express.Router();

imageRouter.get(`/image-list`, imageController.imageList);
imageRouter.get(`/find-image`, imageController.FindImage);
imageRouter.get(`/image-detail`, imageController.ImageDetail);
imageRouter.delete(`/delete-image`, imageController.DeleteImage);

export default imageRouter;