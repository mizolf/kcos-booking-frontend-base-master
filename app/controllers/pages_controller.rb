class PagesController < ApplicationController

  def home
    @show_header = true
	@post = Post.visible(allow_previews?).order(publish_at: :desc).first
    @spaces = Space.all
    @page_meta_tag = PageMetaTag.find_by(page: "Pocetna")
    @page_content = LandingPage.first_or_create
  end

end
