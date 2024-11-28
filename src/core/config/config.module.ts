import { Module } from '@nestjs/common';
import { ConfigModule as ConfigModulePackage } from '@nestjs/config';
import databaseConfig from '../../config/database.config';
import configSchema from '../../config/config.schema';
@Module({
  imports: [
    ConfigModulePackage.forRoot({
      ignoreEnvFile: process.env.NODE_ENV === 'production',
      envFilePath: '.env',
      load: [databaseConfig],
      validationSchema: configSchema,
      isGlobal: true,
    }),
  ],
})
export class ConfigModule {}
