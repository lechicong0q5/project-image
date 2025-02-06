import { responseError, responseSuccess } from "../common/helpers/reposonse.helper.js";
import imageService from "../services/image.service.js";


const imageController = {
   imageList: async (req, res, next) => {
      try {
         const image = await imageService.imageList(req);
         const resData = responseSuccess(image, `Get List Image Successfully`, 200);
         res.status(resData.code).json(resData);
      } catch (error) {
         next(error)
      }
   },
   FindImage: async (req, res, next) => {
      try {
          const data = await imageService.FindImage(req);
          const resData = responseSuccess(data, "Find Image Successfully", 200);
          res.status(resData.code).json(resData);
      } catch (error) {
          console.error("Error in FindImage:", error);
          next(error);
      }
  },
  ImageDetail: async (req, res, next) => {
   try {
       const data = await imageService.ImageDetail(req);
       const resData = responseSuccess(data, "Find Detail Successfully", 200);
       res.status(resData.code).json(resData);
   } catch (error) {
       console.error("Error in FindImage:", error);
       next(error);
   }
},
   DeleteImage: async (req, res, next) => {
   try {
    const data = await imageService.DeleteImage(req);
    const resData = responseSuccess(data, "Delete Image Successfully", 200);
    res.status(resData.code).json(resData);
   } catch (error) {
    next(error);
   }
   },
};

export default imageController;
