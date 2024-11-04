module SlackNotifier

  def notify
    SlackNotifyJob.perform_later(compose_error_message_for_slack_notification, request.original_url) if status_code == "500" &&  Rails.env.production?
  end

  def compose_error_message_for_slack_notification
    exception = request.env['action_dispatch.exception']
    error_message = exception.message.to_s.first(500)
    source_extract = exception.source_extract.join("\n")
    message = ""
    message << "*Application:* #{Rails.application.class.to_s.split("::").first} -> #{request.original_url} \n"
    message << "*Date:* #{DateTime.now.in_time_zone.strftime("%d.%m.%Y. %H:%M:%S")} \n"
    message << "*Admin:* #{current_admin ? current_admin.email : 'no session'} \n"  if Object.const_defined?("Admin")
    message << "*User:* #{current_user ? current_user.email : 'no session'} \n"  if Object.const_defined?("User")
    message << "*Error:* ```#{error_message}``` \n"
    message << "*Source:* ```#{source_extract}``` \n"
  end

end