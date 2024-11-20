import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Put,
  Delete,
  Options,
  Head,
} from '@nestjs/common';
import { AppService } from './app.service';

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) {}

  @Get()
  getHello() {
    return {
      message: 'Hello World!',
    };
  }

  @Post()
  saveInfo(@Body() body: any) {
    return {
      ...body,
    };
  }

  @Patch(':id')
  updateInfo(@Body() body: any, @Param('id') id: string) {
    return {
      id,
      ...body,
    };
  }

  @Put(':id')
  replaceInfo(@Body() body: any, @Param('id') id: string) {
    return {
      id,
      ...body,
    };
  }

  @Delete(':id')
  deleteInfo(@Param('id') id: string) {
    return {
      id,
      message: 'Deleted',
    };
  }
}
