class AdminMailer < ApplicationMailer
  def send_credentials(admin, token)
    @admin = admin
    @token = token
    mail(to: recipient(@admin.email), from: "#{AppInfo.name} <#{AppInfo.no_reply_mail}>", subject: t("mailing.cms_credentials.subject", app_name: AppInfo.name))
  end
end
