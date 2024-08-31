import { Module } from '@nestjs/common';
import { ConfigModule, ConfigService } from '@nestjs/config';
import { TypeOrmModule } from '@nestjs/typeorm';
import { PassportModule } from '@nestjs/passport';
import { User } from './common/entities/user.entity';
import { AuthController } from './controllers/auth.controller';
import { AuthService } from './services/auth.service';

@Module({
    imports: [
        ConfigModule.forRoot(), // Asegúrate de que esto esté incluido
        TypeOrmModule.forFeature([User]),
        TypeOrmModule.forRootAsync({
            imports: [ConfigModule],
            inject: [ConfigService],
            useFactory: async (configService: ConfigService) => ({
                type: 'mysql',
                host: configService.get<string>('DB_MAIN_HOST'),
                port: parseInt(configService.get<string>('DB_MAIN_PORT'), 10),
                username: configService.get<string>('DB_MAIN_USER'),
                password: configService.get<string>('DB_MAIN_PASSWORD'),
                database: configService.get<string>('DB_MAIN_DATABASE'),
                synchronize: true,
                autoLoadEntities: true,
                entities: [__dirname + '/../**/*.entity{.ts,.js}'],
                logging: true,
            }),
        }),
        PassportModule,
    ],
    controllers: [AuthController],
    providers: [AuthService],
})
export class AuthModule {}
