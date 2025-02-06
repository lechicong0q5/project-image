import express from "express";
import CommentController from "../controllers/comment.controller.js";


const CommentRouter = express.Router();

CommentRouter.get(`/find-comment`, CommentController.FindComment);
CommentRouter.post(`/add-comment`, CommentController.AddComment);


export default CommentRouter;