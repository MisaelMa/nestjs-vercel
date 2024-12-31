import { DataSource } from 'typeorm';
import { postgresConfig } from './database.config';
import { ConfigModule } from '@nestjs/config';

ConfigModule.forRoot({
  envFilePath: `.env`,
});

export const dataSource = new DataSource(postgresConfig());

export default dataSource;
