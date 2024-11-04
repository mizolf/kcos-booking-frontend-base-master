# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

ActionMailer::Base.smtp_settings = {
    :user_name => 'postmaster@mg.bamboomail.eu',
    :password => '2f2df1ed44541529bb4c03e135a729b7',
    :domain => 'mg.bamboomail.eu',
    :address => 'smtp.mailgun.org',
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true
}
