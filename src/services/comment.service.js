import { BadRequestException } from "../common/helpers/error.helper.js";
import prisma from "../common/prisma/init.prisma.js"

const CommentService = {
   FindComment: async (req) => {
      const { image_id } = req.query;
  
      // Kiểm tra nếu không có image_id được truyền vào
      if (!image_id) {
          throw new Error("Image ID is required");
      }
  
      // Tìm danh sách comment theo image_id
      const comments = await prisma.comments.findMany({
          where: {
              image_id: Number(image_id),
          },
          select: {
              comment_id: true,
              images: {
               select: {
                  image_id: true,
                  image_url: true,
               }
              },
              content: true,
              user_id: true,
              users: {
                  select: {
                      full_name: true,
                  },
              },
              created_at: true,
          },
          orderBy: {
              created_at: "desc",
          },
      });
  
      return { items: comments };
  },
  AddComment: async (req) => {
    let { image_id, user_id, content } = req.body;

    
    image_id = Number(image_id);
    user_id = Number(user_id);

    if (isNaN(image_id) || isNaN(user_id)) {
        throw new BadRequestException("user_id và image_id phải là số");
    }

    
    const userExists = await prisma.users.findFirst({
        where: { user_id: user_id }
    });

    if (!userExists) {
        throw new BadRequestException(`User không tồn tại`);
    }

    
    const imageExists = await prisma.images.findFirst({
        where: { image_id: image_id }
    });

    if (!imageExists) {
        throw new BadRequestException(`Ảnh không tồn tại`);
    }


    const newComment = await prisma.comments.create({
        data: {
            image_id: image_id,
            user_id: user_id,
            content: content,
        }
    });

    return newComment;
}

  
}

export default CommentService;