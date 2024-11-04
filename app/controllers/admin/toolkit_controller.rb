class Admin::ToolkitController < Admin::BaseController
  before_action :restrict_to_development, :only => [:toolkit]

  def index
	@navigation_disabled = true
	@header_disabled = true
	@footer_disabled = true
	@icons = Dir.glob(["app/assets/images/icons/*.svg", "app/assets/images/icons/*.png"])
	@icons_nav = Dir.glob("app/assets/images/icons/nav/*")
	@element = params[:element]
  end

end