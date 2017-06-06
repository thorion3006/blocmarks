if Rails.env.production?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    address:        ENV['MAILGUN_SMTP_SERVER'],
    port:           ENV['MAILGUN_SMTP_PORT'],
    authentication: :plain,
    user_name:      ENV['MAILGUN_SMTP_LOGIN'],
    password:       ENV['MAILGUN_SMTP_PASSWORD'],
    domain:         ENV['MAILGUN_DOMAIN'],
    content_type:      'text/html'
  }
  ActionMailer::Base.raise_delivery_errors = true
end
