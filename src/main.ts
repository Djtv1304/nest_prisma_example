import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import { SwaggerModule, DocumentBuilder } from '@nestjs/swagger';

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  const isProduction = process.env.NODE_ENV === "prod";

  if (!isProduction) {
    const config = new DocumentBuilder()
      .setTitle('Nest JS Prisma')
      .setDescription('This is a  Nest JS using Prisma and MSSQL')
      .setVersion('1.0')
      .build();

    const documentFactory = () => SwaggerModule.createDocument(app, config);
    SwaggerModule.setup('api', app, documentFactory);
  }
  await app.listen(process.env.PORT ?? 3000);
}
bootstrap();
