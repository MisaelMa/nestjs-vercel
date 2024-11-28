import { registerAs } from '@nestjs/config';
import { DataSourceOptions } from 'typeorm';

const postgresConfig = (): DataSourceOptions => {
  return {
    type: 'postgres',
    host: process.env.DB_HOST,
    port: Number(process.env.DB_PORT),
    username: process.env.DB_USERNAME,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_DATABASE,
    entities: [__dirname + '/../**/*.entity{.ts,.js}'],
    synchronize: true,
  };
};

export default registerAs('database', () => ({
  config: postgresConfig(),
}));
