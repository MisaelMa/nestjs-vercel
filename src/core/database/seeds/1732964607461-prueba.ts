import { Account } from '../../../ecommerce/accounts/account.entity';
import { DataSource } from 'typeorm';
import { Seeder, SeederFactoryManager } from 'typeorm-extension';

export class Prueba1732964607461 implements Seeder {
  track = false;

  public async run(
    dataSource: DataSource,
    factoryManager: SeederFactoryManager,
  ): Promise<any> {
    console.log('Running seed Prueba1732964607461');

    const userFactory = factoryManager.get(Account);
    // save 1 factory generated entity, to the database
    //await userFactory.save();

    // save 5 factory generated entities, to the database
    await userFactory.saveMany(5);
  }
}
