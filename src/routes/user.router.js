import express from "express";
import UserController from "../controllers/user.controller.js";


const userRouter = express.Router();

userRouter.get(`/user-list`, UserController.FindUser);
userRouter.get(`/find-userSave`, UserController.FindUserSave);
userRouter.get(`/find-userCreate`, UserController.FindUserCreate);


export default userRouter;