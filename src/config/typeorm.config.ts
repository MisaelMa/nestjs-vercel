import { DataSource } from 'typeorm';
import { postgresConfig } from './database.config';
import { ConfigModule } from '@nestjs/config';

ConfigModule.forRoot({
  envFilePath: `.env`,
});

const AppDataSource = new DataSource(postgresConfig());

export default AppDataSource;
