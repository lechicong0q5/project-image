import prisma from "../common/prisma/init.prisma.js"

const UserService = {
    FindUser: async (req) => {
        const user = await prisma.users.findMany({
    select: {
    user_id: true,
    email: true,
    pass_word: true,
    full_name: true,
            }
        });
        return {
           items: user,
        };
    },
    FindUserSave: async (req) => {
        const {user_id} = req.query;

    const user = await prisma.saved_images.findMany({
       where: {
          user_id: Number(user_id),
      },
      select: {
          image_id: true,
          images: {
            select: {
                title: true,
                description: true,
                image_url: true,
            }
          },
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
       
       return {item: user};         
       },
    FindUserCreate: async(req) => {
        const {user_id} = req.query;

    const user = await prisma.images.findMany({
       where: {
          user_id: Number(user_id),
      },
      select: {
          image_id: true,
          image_url: true,
          description: true,
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
       
       return {item: user};       
    }
}

export default UserService;