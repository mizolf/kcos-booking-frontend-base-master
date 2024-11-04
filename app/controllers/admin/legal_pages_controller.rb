class Admin::LegalPagesController < Admin::BaseController
  before_action :set_legal_page, only: [:show, :update, :destroy]

  def index
    @legal_pages = LegalPage.all
  end

  def new
    @legal_page = LegalPage.new
  end

  def create
    @legal_page = LegalPage.new(legal_page_params)
    if @legal_page.save
      redirect_to admin_legal_page_path(@legal_page, tab: params[:tab]), notice: t('message.created')
    else
      render :new
    end
  end

  def show; end

  def update
    if @legal_page.update(legal_page_params)
      @legal_pages = LegalPage.all
      redirect_to admin_legal_page_path(@legal_page, tab: params[:tab]), notice: t('message.updated')
    else
      render :show
    end
  end

  def destroy
    if @legal_page.destroy
      redirect_to admin_legal_pages_path, notice: t('message.deleted')
    else
      redirect_to admin_legal_pages_path, alert: t('message.something_wrong')
    end
  end

  def sort
      params[:legal_page].each_with_index do |id, index|
        LegalPage.where(id: id).update_all(position: index + 1)
      end
  end

  private

  def legal_page_params
    params.require(:legal_page).permit(
    	:name, :title, :slug, :content, :list,
      :seo_description, :seo_title, :seo_keywords
    )
  end

  def set_legal_page
    @legal_page = LegalPage.friendly.find(params[:id])
  end
end