Rails.application.configure do
  config.time_zone = 'Tokyo'
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.assets.compile = true
  config.serve_static_files = true
  config.assets.css_compressor = :scss

  config.read_encrypted_secrets = true
  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?
  config.assets.js_compressor = Uglifier.new(harmony: true)

  config.force_ssl = true
  config.log_level = :debug
  config.log_tags = [ :request_id ]

  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify

  config.log_formatter = ::Logger::Formatter.new
  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false

  # herokuメール送信設定
  config.action_mailer.perform_caching = false
  config.action_mailer.raise_delivery_errors = true
  config.action_mailer.delivery_method = :smtp
  host = 'soudan-app.herokuapp.com'
  config.action_mailer.default_url_options = { host: host }
  config.action_mailer.perform_deliveries = true

  ActionMailer::Base.smtp_settings = {
    :address        => 'smtp.sendgrid.net',
    :port           => '587',
    :authentication => :plain,
    :user_name      => ENV['SENDGRID_USERNAME'],
    :password       => ENV['SENDGRID_PASSWORD'],
    :domain         => 'soudan-app.herokuapp.com',
    :enable_starttls_auto => true
  }

end
