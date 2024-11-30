import { DataSource } from 'typeorm';
import { postgresConfig } from './database.config';

ConfigModule.forRoot({
  envFilePath: `.env`,
});

const AppDataSource = new DataSource(postgresConfig());

export default AppDataSource;
