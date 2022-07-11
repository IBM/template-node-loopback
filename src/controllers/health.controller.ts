import {get} from '@loopback/rest';

export class HealthController {
  @get('/health')
  hello(): object {
    return {'status':"UP"};
  }
}