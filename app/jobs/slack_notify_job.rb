class SlackNotifyJob < ActiveJob::Base
  queue_as :default 

  def perform(message, url, options={})
    params = {
      environment: resolve_environment,
      username: defined?(AppInfo) ? AppInfo.name : Rails.application.class.parent_name,
      message: message,
      channel: options[:channel],
      url: url
    }
    send_notification(params)
  end

  def resolve_environment
    return "local" if Rails.env.development?
    return "development" if ENV['BOOM_ENV'] == 'development'
    return "production" if ENV['BOOM_ENV'] == 'production'
  end

  def send_notification(params)
    res = Net::HTTP.post_form(URI.parse('http://notifier.dev.bambooapp.eu/errors'), params)
  end
end