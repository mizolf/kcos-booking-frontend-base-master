class ToolkitController < ApplicationController
  before_action :restrict_to_development

	def index
		@navigation_disabled = true
		@footer_disabled = true
		@icons = Dir.glob(["app/assets/images/icons/*.svg", "app/assets/images/icons/*.png"])
		@icons_social = Dir.glob("app/assets/images/icons/social/*")
    	@element = params[:element]
	end

end
