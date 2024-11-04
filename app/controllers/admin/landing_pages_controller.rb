class Admin::LandingPagesController < Admin::BaseController
	before_action do
		restrict_access(:admin)
	end

	def show
		@landing_page = LandingPage.first_or_create
	end

	def update
		@landing_page = LandingPage.first
		if @landing_page.update(landing_page_params)
			redirect_to admin_landing_page_path(tab: params[:tab]), notice: t('message.updated')
		else
			render params[:settings], alert: t('message.something_not_right')
		end
	end

	private

	def landing_page_params
		params.require(:landing_page).permit(:about_project,
			gallery_images_attributes: [
				:id, :image, :image_alt, :image_cache, :position, :_destroy
			]
		)
	end
end 