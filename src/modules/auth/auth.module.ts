import { Module } from '@nestjs/common';
import { ConfigModule, ConfigService } from '@nestjs/config';
import { TypeOrmModule } from '@nestjs/typeorm';
import { User } from './common/entities/user.entity';
import { AuthController } from './controllers/auth.controller';
import { AuthService } from './services/auth.service';
import { JwtModule } from '@nestjs/jwt';
import ormConfig from '../../config/orm.config';


@Module({
    imports: [
        ConfigModule.forRoot({isGlobal: true, envFilePath: ['.env', '../.env']}),
        TypeOrmModule.forFeature([User]),
        TypeOrmModule.forRoot(ormConfig),
        JwtModule.register({
            secret: process.env.JWT_SECRET,
            signOptions: {expiresIn: process.env.JWT_EXPIRES_IN},
        }),
    ],
    controllers: [AuthController],
    providers: [AuthService],
})
export class AuthModule {}
