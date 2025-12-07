const request = require('supertest');
const app = require('../src/app');

describe('SO & CI/CD demo app', () => {
  test('GET / debe responder con info de sistema', async () => {
    const res = await request(app).get('/');
    expect(res.statusCode).toBe(200);
    expect(res.body).toHaveProperty('message');
    expect(res.body).toHaveProperty('nodeEnv');
  });

  test('GET /health debe responder ok', async () => {
    const res = await request(app).get('/health');
    expect(res.statusCode).toBe(200);
    expect(res.body).toHaveProperty('status', 'ok');
  });

  test('GET /env debe mostrar variables de entorno', async () => {
    process.env.VERSION = '2.0.0';
    const res = await request(app).get('/env');
    expect(res.statusCode).toBe(200);
    expect(res.body).toHaveProperty('version', '2.0.0');
  });
});