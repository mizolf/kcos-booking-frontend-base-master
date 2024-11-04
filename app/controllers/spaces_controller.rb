class SpacesController < ApplicationController

	def index
		@spaces = Space.all
	    @page_meta_tag = PageMetaTag.find_by(page: "Prostori")
	end

	def show
		@space = Space.find(params[:id])
	end

end