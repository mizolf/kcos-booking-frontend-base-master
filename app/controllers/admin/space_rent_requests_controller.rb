class Admin::SpaceRentRequestsController < Admin::BaseController

	def index
		@space_rent_requests = SpaceRentRequest.all
	end

	def show
		@space_rent_request = SpaceRentRequest.find(params[:id])
		@space_rent_request.update_column(:seen_at, DateTime.current) unless @space_rent_request.seen_at
	end

end