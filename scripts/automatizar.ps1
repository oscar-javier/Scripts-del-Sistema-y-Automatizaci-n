const express = require('express');

const app = express();


app.get('/', (req, res) => {
  const APP_VERSION = process.env.VERSION || '1.0.0';
  const NODE_ENV = process.env.NODE_ENV || 'development';

  res.json({
    message: 'SO & CI/CD demo app',
    nodeEnv: NODE_ENV,
    version: APP_VERSION,
    platform: process.platform,
    uptime: process.uptime()
  });
});


app.get('/health', (req, res) => {
  res.json({
    status: 'ok',
    timestamp: new Date().toISOString()
  });
});


app.get('/env', (req, res) => {
  const APP_VERSION = process.env.VERSION || '1.0.0';
  const NODE_ENV = process.env.NODE_ENV || 'development';

  res.json({
    nodeEnv: NODE_ENV,
    version: process.env.VERSION || APP_VERSION,
    customVar: process.env.CUSTOM_VAR || 'not-set'
  });
});

module.exports = app;