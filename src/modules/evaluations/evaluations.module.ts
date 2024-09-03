import { Module } from "@nestjs/common";
import { ConfigModule } from "@nestjs/config";
import { TypeOrmModule } from "@nestjs/typeorm";
import ormConfig from "../../config/orm.config";
import { JwtModule } from "@nestjs/jwt";
import { EvaluationController } from "./controllers/evaluation.controller";
import { EvaluationsService } from "./services/evaluations.service";
import { Evaluacion } from "./common/entities/evaluations.entity";


@Module({
    imports: [
        ConfigModule.forRoot({isGlobal: true, envFilePath: ['.env']}),
        TypeOrmModule.forRoot(ormConfig),
        JwtModule.register({
            secret: process.env.JWT_SECRET,
            signOptions: {expiresIn: process.env.JWT_EXPIRES_IN},
        }),
        TypeOrmModule.forFeature([Evaluacion]),


    ],

    controllers: [EvaluationController],
    providers: [EvaluationsService]
})

export class EvaluationsModule {}
