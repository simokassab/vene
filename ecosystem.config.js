module.exports = {
  apps: [{
    name: 'vene_jewelry',
    cwd: '/var/www/vene',
    script: 'bin/rails',
    args: 'server -b 0.0.0.0 -p 3001',
    interpreter: '/root/.rbenv/shims/ruby',
    env: {
      RAILS_ENV: 'production',
      RAILS_MASTER_KEY: '957a8b123ce5187fb8674dadcbb52217',
      DATABASE_HOST: '127.0.0.1',
      DATABASE_PORT: '5432',
      DATABASE_USERNAME: 'x_care_user',
      DATABASE_PASSWORD: 'Sama2022',  // UPDATE THIS with your PostgreSQL password
      DATABASE_NAME: 'vene_production',
      REDIS_URL: 'redis://localhost:6379/1',  // Using DB 1 to separate from xcare
      RAILS_SERVE_STATIC_FILES: 'true',
      RAILS_LOG_TO_STDOUT: 'true',
      SECRET_KEY_BASE: '653b699a45a00689c9732db049b69550584fba63e6f6a6e40385217ee694a07f6809a61b1baf6ef558c7cf7aa89d3b7d6da936f87b9f760a92a549a441412417',  // UPDATE THIS - generate with: rails secret
    },
    instances: 1,
    exec_mode: 'fork',
    autorestart: true,
    watch: false,
    max_memory_restart: '1G',
    error_file: '/root/.pm2/logs/vene_jewelry-error.log',
    out_file: '/root/.pm2/logs/vene_jewelry-out.log',
    log_file: '/root/.pm2/logs/vene_jewelry-combined.log',
    time: true
  },
  {
    name: 'vene_sidekiq',
    cwd: '/var/www/vene',
    script: '/root/.rbenv/shims/bundle',
    args: 'exec sidekiq',
    interpreter: 'none',
    env: {
      RAILS_ENV: 'production',
      RAILS_MASTER_KEY: '957a8b123ce5187fb8674dadcbb52217',
      DATABASE_HOST: '127.0.0.1',
      DATABASE_PORT: '5432',
      DATABASE_USERNAME: 'x_care_user',
      DATABASE_PASSWORD: 'Sama2022',
      DATABASE_NAME: 'vene_production',
      REDIS_URL: 'redis://localhost:6379/1',
    },
    instances: 1,
    exec_mode: 'fork',
    autorestart: true,
    watch: false,
    max_memory_restart: '1G',
    error_file: '/root/.pm2/logs/vene_sidekiq-error.log',
    out_file: '/root/.pm2/logs/vene_sidekiq-out.log',
    log_file: '/root/.pm2/logs/vene_sidekiq-combined.log',
    time: true
  }]
};
