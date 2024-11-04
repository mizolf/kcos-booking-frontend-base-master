class DocumentsController < ApplicationController
	def index
		@documents = Document.all
	    @page_meta_tag = PageMetaTag.find_by(page: "Dokumenti")
	end
end