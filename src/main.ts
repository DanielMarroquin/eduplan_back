import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { ValidationPipe } from '@nestjs/common';
import { DocumentBuilder, SwaggerModule } from '@nestjs/swagger';
import * as dotenv from 'dotenv';

async function bootstrap() {
  dotenv.config();
  const port = 3000;
  const app = await NestFactory.create(AppModule);

  app.setGlobalPrefix('api/v1');
  app.useGlobalPipes(new ValidationPipe({}));
  app.enableCors({
    origin: [process.env.FRONTEND_URL],
  });

  const config = new DocumentBuilder()
    .setTitle('EduPlan')
    .setDescription('API EduPlan Plataforma de educación')
    .setVersion('1.0')
    .addTag('API')
    .build();
  const document = SwaggerModule.createDocument(app, config);
  SwaggerModule.setup('docs', app, document);

  await app.listen(port);
  console.log(`API running in http://localhost:${port}/api/v1`);
}

bootstrap();
