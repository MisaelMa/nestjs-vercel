import { DataSource } from 'typeorm';
import { Seeder, SeederFactoryManager } from 'typeorm-extension';
import { Account } from '../../../ecommerce/accounts/account.entity';

export class Steps1732965450472 implements Seeder {
  public async run(
    dataSource: DataSource,
    factoryManager: SeederFactoryManager,
  ): Promise<any> {
    console.log('Running seed Steps1732965450472');
    const repository = dataSource.getRepository(Account);
    await repository.insert([
      {
        name: 'John Doe',
        is_active: true,
        create_at: new Date(),
      },
    ]);
  }
}
