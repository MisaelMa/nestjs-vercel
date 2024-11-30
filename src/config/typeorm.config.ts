import { DataSource } from 'typeorm';
import { postgresConfig } from './database.config';

const AppDataSource = new DataSource(postgresConfig());

export default AppDataSource;
