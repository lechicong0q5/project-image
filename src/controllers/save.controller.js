import { responseError, responseSuccess } from "../common/helpers/reposonse.helper.js";
import SaveService from "../services/save.service.js";


const SaveController = {
   FindSave: async (req, res, next) => {
      try {
         const comment = await SaveService.FindSave(req);
         const resData = responseSuccess(comment, `Find Save Image Successfully`, 200);
         res.status(resData.code).json(resData);
      } catch (error) {
         next(error)
      }
   },
};

export default SaveController;
