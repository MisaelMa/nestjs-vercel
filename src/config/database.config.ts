import { registerAs } from '@nestjs/config';
import { resolve } from 'path';
import { DataSourceOptions } from 'typeorm';

export const postgresConfig = (): DataSourceOptions => {
  return {
    type: 'postgres',
    host: process.env.DB_HOST,
    port: Number(process.env.DB_PORT),
    username: process.env.DB_USERNAME,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_DATABASE,
    entities: [__dirname + '/../**/*.entity{.ts,.js}'],
    migrations: [
      resolve(__dirname, '..', 'core', 'database', 'migrations', '*{.ts,.js}'),
    ],
    synchronize: true,
  };
};

export default registerAs('database', () => ({
  config: postgresConfig(),
}));
