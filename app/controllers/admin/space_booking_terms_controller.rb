class Admin::SpaceBookingTermsController < Admin::BaseController

	def change_status
		@space_booking_term = SpaceBookingTerm.find(params[:id])
		if @space_booking_term.status_can_be_changed?
			if @space_booking_term.update(status: params[:status])
				flash.now[:notice] = t('message.status_changed')
			else
				flash.now[:alert] = t('message.something_wrong')
			end
		else
			flash.now[:alert] = t('message.status_cant_be_changed')
		end
	end

end