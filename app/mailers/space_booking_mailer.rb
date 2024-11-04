class SpaceBookingMailer < ApplicationMailer

	def notify_about_changes(space_booking)
	    @space_booking = space_booking
	    mail(to: recipient(@space_booking.email), from: "#{AppInfo.name} <#{AppInfo.no_reply_mail}>", subject: t("mailing.space_booking_notification.subject"))
	end

end
