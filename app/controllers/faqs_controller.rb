class FaqsController < ApplicationController
	def index
		@faqs = Faq.all
	    @page_meta_tag = PageMetaTag.find_by(page: "Cesta pitanja")
	end
end
