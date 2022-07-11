import {Client} from '@loopback/testlab';
import {LbApiApplication} from '../..';
import {setupApplication} from './test-helper';

describe('Health', () => {
  let app: LbApiApplication;
  let client: Client;

  before('setupApplication', async () => {
    ({app, client} = await setupApplication());
  });

  after(async () => {
    await app.stop();
  });

  it('GET health check', async () => {
    await client
      .get('/health')
      .expect(200)
      .expect('Content-Type', /application\/json/)
      .expect(/{"status":"UP"}/);
  });

});
