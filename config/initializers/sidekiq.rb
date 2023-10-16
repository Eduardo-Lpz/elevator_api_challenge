# frozen_string_literal: true

require "sidekiq-unique-jobs"

Sidekiq.configure_server do |config|
  config.redis = { url: ENV.fetch("REDIS_URL", nil), driver: :ruby }

  config.client_middleware do |chain|
    chain.add SidekiqUniqueJobs::Middleware::Client
  end

  config.server_middleware do |chain|
    chain.add SidekiqUniqueJobs::Middleware::Server
  end

  SidekiqUniqueJobs::Server.configure(config)
end
