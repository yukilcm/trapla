Sentry.init do |config|
  config.dsn = 'https://8eee33d3296f4dd2b7ae236dac03f2ca@o1009583.ingest.sentry.io/5973774'
  config.breadcrumbs_logger = [:active_support_logger, :http_logger]

  # Set tracesSampleRate to 1.0 to capture 100%
  # of transactions for performance monitoring.
  # We recommend adjusting this value in production
  config.traces_sample_rate = 0.5
  # or
  config.traces_sampler = lambda do |context|
    true
  end
end