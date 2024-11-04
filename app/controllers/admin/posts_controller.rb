class Admin::PostsController < Admin::BaseController
  before_action :set_post, only: [:show, :update, :destroy]

  def index
    @posts = params[:filter] == :unpublished ? Post.unpublished : Post.visible
  end

  def show
    @post = Post.friendly.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to admin_post_path(@post, tab: params[:tab]), notice: t('message.created')
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to admin_post_path(@post, tab: params[:tab]), notice: t('message.updated')
    else
      render :show
    end
  end

  def destroy
    if @post.destroy
      redirect_to admin_posts_path, notice: t('message.deleted')
    else
      redirect_to admin_posts_path, alert: t('message.something_wrong')
    end
  end

  private

    def post_params
      params.require(:post).permit(
      	:image, :image_cache, :image_alt, :title, :summary, :text, :preview,
        :publish_at, :slug, :seo_image, :seo_description, :seo_title, :seo_keywords
      )
    end

    def set_post
      @post = Post.friendly.find(params[:id])
    end
end