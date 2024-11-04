class AdminMailerPreview < ActionMailer::Preview

	def send_credentials
		admin = Admin.all.sample
		token = String.random(12)
		AdminMailer.send_credentials(admin, token)
	end

end