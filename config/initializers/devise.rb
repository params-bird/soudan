Devise.setup do |config|
  config.secret_key = 'faf69589ab4854c061ffaec8c2324e5fc67b2821034336b15ea8f5b221623715bce3139b7b8c6ec7a8309b976adaefecc2f7a41f59e0d36f879f3aaefdc6d414'
  config.mailer_sender = 'info@soudan-app.herokuapp.com'
  config.omniauth :line, ENV['LINE_KEY'], ENV['LINE_SECRET']

  Rails.application.config.middleware.use OmniAuth::Builder do
    provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'],
      {
        scope: 'userinfo.email, userinfo.profile',
        prompt: 'select_account',
        image_aspect_ratio: 'square',
        image_size: 50
      }
  end









  require 'devise/orm/active_record'

  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 11
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.unlock_strategy = :email
  config.maximum_attempts = 4
  config.reset_password_within = 6.hours
  config.scoped_views = true
  config.sign_out_via = :delete
end
