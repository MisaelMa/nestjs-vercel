import { MigrationInterface, QueryRunner } from 'typeorm';

export class Autogenerada1732936745726 implements MigrationInterface {
  name = 'Autogenerada1732936745726';

  public async up(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(`ALTER TABLE "accounts" DROP COLUMN "update_at"`);
  }

  public async down(queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query(
      `ALTER TABLE "accounts" ADD "update_at" TIMESTAMP NULL`,
    );
  }
}
