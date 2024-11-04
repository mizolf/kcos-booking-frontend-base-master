class ApplicationMailer < ActionMailer::Base
  layout 'mailer'

  def recipient(email)
    if ENV['BOOM_ENV'] == "production"
      email
    else
      AppInfo.dev_email
    end
  end

end
