import { responseError, responseSuccess } from "../common/helpers/reposonse.helper.js";
import CommentService from "../services/comment.service.js";


const CommentController = {
   FindComment: async (req, res, next) => {
      try {
         const comment = await CommentService.FindComment(req);
         const resData = responseSuccess(comment, `Find Comment Successfully`, 200);
         res.status(resData.code).json(resData);
      } catch (error) {
         next(error)
      }
   },
   AddComment: async(req, res, next) => {
      try {
         const comment = await CommentService.AddComment(req);
         const resData = responseSuccess(comment, `Add Comment Successfully`, 200);
         res.status(resData.code).json(resData);
      } catch (error) {
         next(error)
      }
   }
};

export default CommentController;
