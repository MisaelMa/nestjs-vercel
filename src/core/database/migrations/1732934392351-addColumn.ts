import { MigrationInterface, QueryRunner } from "typeorm";

export class AddColumn1732934392351 implements MigrationInterface {
    name = 'AddColumn1732934392351'

    public async up(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE "accounts" ADD "delete_at" TIMESTAMP`);
    }

    public async down(queryRunner: QueryRunner): Promise<void> {
        await queryRunner.query(`ALTER TABLE "accounts" DROP COLUMN "delete_at"`);
    }

}
