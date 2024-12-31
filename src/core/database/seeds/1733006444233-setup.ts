import { DataSource } from 'typeorm';
import { runSeeders, Seeder, SeederFactoryManager } from 'typeorm-extension';
import { Steps1732965450472 } from './1732965450472-steps';
import { Prueba1732964607461 } from './1732964607461-prueba';

export class Setup1733006444233 implements Seeder {
  track = false;

  public async run(
    dataSource: DataSource,
    factoryManager: SeederFactoryManager,
  ): Promise<any> {
    await runSeeders(dataSource, {
      seeds: [Prueba1732964607461, Steps1732965450472],
      factoriesLoad: true,
    });
  }
}
