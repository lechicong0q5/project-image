import express from 'express'
// import videoRouter from './video.router.js'
// import carRouter from './car.router.js';
import authRouter from './auth.router.js';
import imageRouter from './image.router.js';
import CommentRouter from './comment.router.js';
import SaveRouter from './save.router.js';
import userRouter from './user.router.js';

const rootRouter = express.Router()


rootRouter.get(`/`, (request, response, next) => {
   response.json(`ok`);
});

rootRouter.use(`/auth`, authRouter)
rootRouter.use(`/image`, imageRouter)
rootRouter.use(`/comment`, CommentRouter)
rootRouter.use(`/save`, SaveRouter)
rootRouter.use(`/user`, userRouter)

export default rootRouter