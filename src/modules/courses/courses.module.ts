import { Module } from "@nestjs/common";
import { ConfigModule } from "@nestjs/config";
import { TypeOrmModule } from "@nestjs/typeorm";
import ormConfig from "../../config/orm.config";
import { JwtModule } from "@nestjs/jwt";
import { Alumno } from "../students/common/entities/students.entity";
import { CoursesController } from "./controllers/courses.controller";
import { CoursesService } from "./services/courses.service";
import { Curso } from "./common/entities/courses.entity";



@Module({
    imports: [
        ConfigModule.forRoot({isGlobal: true, envFilePath: ['.env']}),
        TypeOrmModule.forRoot(ormConfig),
        JwtModule.register({
            secret: process.env.JWT_SECRET,
            signOptions: {expiresIn: process.env.JWT_EXPIRES_IN},
        }),
        TypeOrmModule.forFeature([Curso]),

    ],
    controllers: [CoursesController],
    providers: [CoursesService],
})

export class CoursesModule {}
