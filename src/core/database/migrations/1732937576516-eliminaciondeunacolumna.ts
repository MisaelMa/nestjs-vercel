import { MigrationInterface, QueryRunner } from 'typeorm';

export class Eliminaciondeunacolumna1732937576516
  implements MigrationInterface
{
  name = 'Eliminaciondeunacolumna1732937576516';

  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`ALTER TABLE "accounts" DROP COLUMN "update_at"`);
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`ALTER TABLE "accounts" ADD "update_at" TIMESTAMP`);
  }
}
