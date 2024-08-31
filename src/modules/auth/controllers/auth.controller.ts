import { ApiTags } from "@nestjs/swagger";
import { Body, Controller, HttpException, HttpStatus, Post } from "@nestjs/common";
import { AuthService } from "../services/auth.service";
import { Public } from "../../../common/decorators/metadata.decorator";


@ApiTags('Autenticación')
@Controller('auth')

export class AuthController {
    constructor(
        private authService: AuthService
    ) {
    }


    @Post('sign-in')
    async signIn (@Body() loginDto: { username: string; password: string }) {

        try {
            const user = await this.authService.validateUser(loginDto.username, loginDto.password);
            if (!user) {
                throw new HttpException('Invalid credentials', HttpStatus.UNAUTHORIZED);
            }
            return {
                message: 'Login successful',
                user,
            };

        } catch (err) {
            throw new Error(err)
        }
    }




}
