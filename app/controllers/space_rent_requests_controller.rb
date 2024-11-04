class SpaceRentRequestsController < ApplicationController
	before_action :set_space

	def new
		@app_settings = AppSetting.first_or_create
		@space_rent_request = @space.space_rent_requests.new
	end

	def create
		@space_rent_request = @space.space_rent_requests.new(space_rent_request_params)
		if @space_rent_request.save
			redirect_to space_path(@space), notice: t('message.sent')
		else
			@app_settings = AppSetting.first_or_create
			render :new
		end
	end

	private

	def space_rent_request_params
		params.require(:space_rent_request).permit(
			:first_name, :last_name, :organisation, :phone, :email, :people_count,
			:consent, :work_plan, :work_goal, :partners, :other
		)
	end

	def set_space
		@space = Space.find(params[:id])
		raise ActiveRecord::RecordNotFound unless @space.rentable
	end
end