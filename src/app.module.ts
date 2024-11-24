import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { CoreModule } from './core/core.module';
import { EcommerceModule } from './ecommerce/ecommerce.module';

@Module({
  controllers: [AppController],
  providers: [AppService],
  imports: [CoreModule, EcommerceModule],
})
export class AppModule {}
