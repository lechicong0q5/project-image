import { BadRequestException } from "../common/helpers/error.helper.js";
import prisma from "../common/prisma/init.prisma.js"

const imageService = {
imageList: async (req) => {
      const image = await prisma.images.findMany();

      return {
         items: image,
      };
   },
FindImage: async (req) => {
const title = req.body.title;

const images = await prisma.images.findMany({
 where: {
    title: {
       contains: title,
    },
},
select: {
    image_id: true,
    title: true,
    image_url: true,
    created_at: true,
},
orderBy: {
    created_at: "desc",
},
 })
 
 return {item: images};         
 },
ImageDetail: async (req) => {
    const {image_id} = req.query;

    const images = await prisma.images.findMany({
       where: {
          image_id: Number(image_id),
      },
      select: {
          image_id: true,
          title: true,
          description: true,
          image_url: true,
          user_id: true,
          users: {
              select: {
                  full_name: true,
              }
          },
          created_at: true,
      },
      orderBy: {
          created_at: "desc",
      },
       })
       
       return {item: images};         
       },
    DeleteImage: async (req) => {
        
            let { image_id } = req.query; 
            image_id = Number(image_id);
        
            if (isNaN(image_id)) {
                throw new BadRequestException("image_id phải là số");
            }
        
            
            const imageExists = await prisma.images.findUnique({
                where: { image_id: image_id },
            });
        
            if (!imageExists) {
                throw new BadRequestException("Ảnh không tồn tại");
            }
        
            
            await prisma.images.delete({
                where: { image_id: image_id },
            });
        
            return { message: "Xóa ảnh thành công", image_id };
    }
}

export default imageService