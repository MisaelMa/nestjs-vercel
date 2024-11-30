import { DataSource } from 'typeorm';
import { postgresConfig } from './database.config';

const amir = new DataSource(postgresConfig());

export default amir;
