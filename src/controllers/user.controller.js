import { responseError, responseSuccess } from "../common/helpers/reposonse.helper.js";
import UserService from "../services/user.service.js";


const UserController = {
   FindUser: async (req, res, next) => {
      try {
         const user = await UserService.FindUser(req);
         const resData = responseSuccess(user, `Find User List Successfully`, 200);
         res.status(resData.code).json(resData);
      } catch (error) {
         next(error)
      }
   },
   FindUserSave: async (req, res, next) => {
       try {
          const usersave = await UserService.FindUserSave(req);
        const resData = responseSuccess(usersave, `Find List User Save Image Successfully`, 200);
        res.status(resData.code).json(resData);
     } catch (error) {
        next(error)
     }
   },
   FindUserCreate: async (req, res, next) => {
    try {
       const usercreate = await UserService.FindUserCreate(req);
       const resData = responseSuccess(usercreate, `Find List User Create Successfully`, 200);
       res.status(resData.code).json(resData);
    } catch (error) {
       next(error)
    }
 },
};

export default UserController;
