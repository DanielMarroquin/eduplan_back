import { ApiTags } from "@nestjs/swagger";
import { Body, Controller, HttpException, HttpStatus, Post, Get } from "@nestjs/common";
import { AuthService } from "../services/auth.service";


@ApiTags('Autenticación')
@Controller('auth')

export class AuthController {
    constructor(
        private readonly authService: AuthService
    ) {
    }


    @Post('sign-in')
    async login(@Body() body: { username: string; password: string }): Promise<{ message: string; success: boolean }> {
        const { username, password } = body;
        return this.authService.signIn(username, password);
    }





}
