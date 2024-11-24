import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Account } from './account.entity';
import { Repository } from 'typeorm';

@Injectable()
export class AccountsService {
  constructor(
    @InjectRepository(Account)
    readonly accountRepository: Repository<Account>,
  ) {}

  async list() {
    return await this.accountRepository.find();
  }
}
