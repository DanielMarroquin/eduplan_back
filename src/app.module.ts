import { Module } from '@nestjs/common';
import { AuthModule } from "./modules/auth/auth.module";
import { ConfigModule } from '@nestjs/config';
import { TypeOrmModule } from '@nestjs/typeorm';
import { StudentsModule } from "./modules/students/students.module";
import ormConfig from './config/orm.config';
import { CoursesModule } from "./modules/courses/courses.module";
import { EvaluationsModule } from "./modules/evaluations/evaluations.module";


@Module({
  imports: [
      // ConfigModule.forRoot({isGlobal: true, envFilePath: ['.env', '../.env']}),
      TypeOrmModule.forRoot(ormConfig),

      AuthModule,
      StudentsModule,
      CoursesModule,
      EvaluationsModule
  ],
  controllers: [],
  providers: [],
})
export class AppModule {}
