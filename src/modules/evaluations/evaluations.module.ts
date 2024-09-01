import { Module } from "@nestjs/common";
import { ConfigModule } from "@nestjs/config";
import { TypeOrmModule } from "@nestjs/typeorm";
import ormConfig from "../../config/orm.config";
import { JwtModule } from "@nestjs/jwt";


@Module({
    imports: [
        ConfigModule.forRoot({isGlobal: true, envFilePath: ['.env']}),
        TypeOrmModule.forRoot(ormConfig),
        JwtModule.register({
            secret: process.env.JWT_SECRET,
            signOptions: {expiresIn: process.env.JWT_EXPIRES_IN},
        }),
        TypeOrmModule.forFeature([]),


    ],

    controllers: [],
    providers: []
})

export class EvaluationsModule {}
