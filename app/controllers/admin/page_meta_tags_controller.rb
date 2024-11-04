class Admin::PageMetaTagsController < Admin::BaseController
	before_action :set_page_meta_tag, only: [:show, :update]

	def index
		@page_meta_tags = PageMetaTag.order(:created_at)
	end

	def show; end

	def update
		if @page_meta_tag.update(page_meta_tag_params)
			redirect_to [:admin, @page_meta_tag], notice: t('message.updated')
		else
			render :show
		end
	end

	private

	def set_page_meta_tag
		@page_meta_tag = PageMetaTag.find(params[:id])
	end

	def page_meta_tag_params
		params.require(:page_meta_tag).permit(:title, :og_title, :description, :keywords, :image, :image_cache)
	end
end
