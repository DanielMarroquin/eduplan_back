import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { AuthModule } from "./modules/auth/auth.module";
import { ConfigModule } from '@nestjs/config';


@Module({
  imports: [
      ConfigModule.forRoot(),
      AuthModule
  ],
  controllers: [],
  providers: [],
})
export class AppModule {}
