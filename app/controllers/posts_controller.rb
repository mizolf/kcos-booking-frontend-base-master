class PostsController < ApplicationController
	before_action :set_post, only: :show

	def index
		@posts = Post.visible(allow_previews?).order(publish_at: :desc).page(params[:page]).per(3)
		@page_meta_tag = PageMetaTag.find_by(page: "Novosti")
	end

	def show
		redirect_to post_path(@post), :status => :moved_permanently if request.path != post_path(@post)
	end

	private

	def set_post
		@post = Post.visible(allow_previews?).friendly.find(params[:id])
	end
end