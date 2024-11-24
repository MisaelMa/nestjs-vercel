import { Controller, Get } from '@nestjs/common';
import { AccountsService } from './accounts.service';

@Controller('accounts')
export class AccountsController {
  constructor(readonly accountsService: AccountsService) {}

  @Get()
  index() {
    return this.accountsService.list();
  }
}
