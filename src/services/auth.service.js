import { ACCESS_TOKEN_EXPIRED, ACCESS_TOKEN_SECRET, REFRESH_TOKEN_EXPIRED, REFRESH_TOKEN_SECRET } from "../common/constant/app.constant.js";
import { BadRequestException } from "../common/helpers/error.helper.js";
import prisma from "../common/prisma/init.prisma.js";
import bcrypt from "bcrypt";
import jwt from "jsonwebtoken"

const authService = {
   register: async (req) => {
    
    //   // Bước 1: nhận dữ liệu: full_name, email, pass_word
      const { full_name, email, pass_word } = req.body;
      console.log({ full_name, email, pass_word });
    //   // Bước 2: lấy email và kiểm tra trong db xem đã có người dùng đó hay chưa
      const userExists = await prisma.users.findFirst({
         where: {
            email: email,
         },
      });
      console.log({ userExists });
      if (userExists) {
         throw new BadRequestException(`Tài khoản đã tồn tại, Vui lòng đăng nhập`);
      }
    //   // mã hoá password
      const passHash = bcrypt.hashSync(pass_word, 10);
    //   // Bước 3: tạo người dùng mới
      const userNew = await prisma.users.create({
         data: {
            email: email,
            full_name: full_name,
            pass_word: passHash,
         },
      });
    //   // xoá password khi trả về
      delete userNew.pass_word;
    //   // Bước 4: trả kết quả thành công
      return userNew;
   },
   login: async (req) => {
      const { email, pass_word } = req.body;
      console.log({ email, pass_word });
      const userExists = await prisma.users.findFirst({
         where: {
            email: email,
         },
      });
      if (!userExists) {
         throw new BadRequestException(`Tài khoản chưa tồn tại, Vui lòng đăng ký`);
      }
      
      if (!userExists.pass_word) {
         if (userExists.face_app_id) {
            throw new BadRequestException(`Vui lòng đăng nhập bằng facebook, để tạo mật khẩu mới`);
         }
         if (userExists.goole_id) {
            throw new BadRequestException(`Vui lòng đăng nhập bằng google, để tạo mật khẩu mới`);
         }
         throw new BadRequestException(`Không hợp lệ, vui lòng liện hệ chăm sóc khách hàng`);
      }

      // so sánh password
      // const isPassword = bcrypt.compareSync(pass_word, userExists.pass_word);
      const isPassword = bcrypt.compareSync(pass_word, userExists.pass_word)
      if (!isPassword) {
         throw new BadRequestException(`Mật khẩu không chính xác`);
      }


      const tokens = authService.createTokens(userExists.user_id);

      return tokens;
   },
   facebookLogin: async (req) => {
      const { name, email, picture, id } = req.body;
      const avatar = picture.data.url;

      console.log({ name, email, avatar, id });

      let userExists = await prisma.users.findFirst({
         where: {
            email: email,
         },
      });

      if (!userExists) {
         userExists = await prisma.users.create({
            data: {
               email: email,
               full_name: name,
               face_app_id: id,
            },
         });
      }

      const tokens = authService.createTokens(userExists.user_id);

      return tokens;
   },
   createTokens: (userId) => {
      if (!userId) throw new BadRequestException(`Không có userId để tạo token`);
      const accessToken = jwt.sign({ userId: userId }, ACCESS_TOKEN_SECRET, { expiresIn: ACCESS_TOKEN_EXPIRED });

      const refreshToken = jwt.sign({ userId: userId }, REFRESH_TOKEN_SECRET, { expiresIn: REFRESH_TOKEN_EXPIRED });

      return {
         accessToken: accessToken,
         refreshToken: refreshToken,
      };
   },
};
export default authService;