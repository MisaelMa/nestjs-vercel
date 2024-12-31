import { setSeederFactory } from 'typeorm-extension';
import { Account } from '../../../ecommerce/accounts/account.entity';
import { faker } from '@faker-js/faker';

export default setSeederFactory(Account, () => {
  const account = new Account();
  account.name = faker.person.fullName();
  account.is_active = true;
  account.create_at = faker.date.recent();
  return account;
});
