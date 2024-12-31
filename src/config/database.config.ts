import { registerAs } from '@nestjs/config';
import { resolve } from 'path';
import { DataSourceOptions } from 'typeorm';
import { SeederOptions } from 'typeorm-extension';

export const postgresConfig = (): DataSourceOptions & SeederOptions => {
  return {
    type: 'postgres',
    host: process.env.DB_HOST,
    port: Number(process.env.DB_PORT),
    username: process.env.DB_USERNAME,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_DATABASE,
    entities: [__dirname + '/../**/*.entity{.ts,.js}'],
    seeds: [resolve(__dirname, '..', 'core', 'database', 'seeds', '*.ts')],
    factories: [
      resolve(__dirname, '..', 'core', 'database', 'factories', '*{.ts,.js}'),
    ],
    migrations: [
      resolve(__dirname, '..', 'core', 'database', 'migrations', '*{.ts,.js}'),
    ],
    synchronize: true,
  };
};

export default registerAs('database', () => ({
  config: postgresConfig(),
}));
