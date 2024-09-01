import { Module } from "@nestjs/common";
import { ConfigModule } from "@nestjs/config";
import { TypeOrmModule } from "@nestjs/typeorm";
import { JwtModule } from "@nestjs/jwt";
import { Alumno } from "./common/entities/students.entity";
import { StudentsService } from "./services/students.service";
import ormConfig from '../../config/orm.config';
import { StudentsController } from "./controllers/students.controller";


@Module({
    imports: [
        ConfigModule.forRoot({isGlobal: true, envFilePath: ['.env']}),
        TypeOrmModule.forRoot(ormConfig),
        JwtModule.register({
            secret: process.env.JWT_SECRET,
            signOptions: {expiresIn: process.env.JWT_EXPIRES_IN},
        }),
        TypeOrmModule.forFeature([Alumno]),

    ],
    controllers: [StudentsController],
    providers: [StudentsService],

})

export class StudentsModule {}
