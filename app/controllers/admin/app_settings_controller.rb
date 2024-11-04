class Admin::AppSettingsController < Admin::BaseController
	before_action do
		restrict_access(:admin)
	end

	def show
		@app_settings = AppSetting.first_or_create
		render params[:settings]
	end

	def update
		@app_settings = AppSetting.first
		if @app_settings.update(app_setting_params)
			redirect_to admin_app_setting_path(settings: params[:settings]), notice: t('message.updated')
		else
			render params[:settings], alert: t('message.something_not_right')
		end
	end

	private

	def app_setting_params
		params.require(:app_setting).permit(:space_booking_consent, :space_rent_consent)
	end
end 