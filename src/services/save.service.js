import prisma from "../common/prisma/init.prisma.js"

const SaveService = {
    FindSave: async (req) => {
        const { image_id } = req.query; // Lấy image_id từ query
    
        // Kiểm tra nếu không có image_id được truyền vào
        if (!image_id) {
            throw new Error("Image ID is required");
        }
    
        // Tìm danh sách người dùng đã lưu ảnh theo image_id
        const savedImages = await prisma.saved_images.findMany({
            where: {
                image_id: Number(image_id),
            },
            select: {
                save_id: true, 
                user_id: true, 
                users: {
                    select: {
                        full_name: true,
                        avatar: true,
                    },
                },
                created_at: true,
            },
            orderBy: {
                created_at: "desc",
            },
        });
    
        return { items: savedImages };
    },
    
  
}

export default SaveService;