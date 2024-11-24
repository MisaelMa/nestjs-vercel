import { registerAs } from '@nestjs/config';
import { DataSourceOptions } from 'typeorm';

const postgresConfig = (): DataSourceOptions => {
  return {
    type: 'postgres',
    host: 'aws-0-us-west-1.pooler.supabase.com',
    port: 6543,
    username: 'postgres.rtwmohczmayxlruecrwa',
    password: 'r3cr34nd0Amir',
    database: 'postgres',
    entities: [__dirname + '/../**/*.entity{.ts,.js}'],
    synchronize: true,
  };
};

export default registerAs('database', () => ({
  config: postgresConfig(),
}));
