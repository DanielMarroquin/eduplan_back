import { ApiTags } from "@nestjs/swagger";
import { Controller, Post } from "@nestjs/common";
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
    async signIn () {
        try {

        } catch (err) {
            throw new Error(err)
        }
    }




}
