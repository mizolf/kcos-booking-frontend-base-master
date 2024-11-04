class LegalPagesController < ApplicationController
	def show
		@legal_page = LegalPage.listed.friendly.find(params[:id])
	end
end