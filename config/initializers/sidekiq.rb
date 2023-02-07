Sidekiq.configure_server do |config|
  config.redis = { url: 'redis://127.0.0.1:7372/0' }
end

Sidekiq.configure_client do |config|
  config.redis = { url: 'redis://127.0.0.1:7372/0' }
end
