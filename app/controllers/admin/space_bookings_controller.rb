class Admin::SpaceBookingsController < Admin::BaseController
	before_action :set_space_booking, only: [:show, :send_update_email]

	def index
		@space_bookings = SpaceBooking.finished.order(created_at: :desc)
	end

	def show; end

	def send_update_email
		if @space_booking.any_status_changes?
			SpaceBookingMailer.notify_about_changes(@space_booking).deliver_now
			@space_booking.update_seen_statuses
			flash.now[:notice] = t('message.sent')
		else
			flash.now[:alert] = t('message.nothing_to_notify')
		end
	end

	private

	def set_space_booking
		@space_booking = SpaceBooking.find(params[:id])
		@space_booking.update(seen_at: DateTime.current) unless @space_booking.seen_at
	end

end
