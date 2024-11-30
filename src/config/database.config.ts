import { registerAs } from '@nestjs/config';
import { DataSourceOptions } from 'typeorm';
import { resolve } from 'path';
console.log(
  'path:',
  resolve(__dirname, '..', 'core', 'database', 'migrations', '*{.ts,.js}'),
);
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
    migrationsTableName: 'migrations_typeorm',
    synchronize: true,
  };
};

export default registerAs('database', () => ({
  config: postgresConfig(),
}));
