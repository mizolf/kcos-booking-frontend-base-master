class Admin::DocumentsController < Admin::BaseController
  before_action :set_document, only: [:show, :update, :destroy]

  def index
    @documents = Document.all
  end

  def show; end

  def new
    @document = Document.new
  end

  def create
    @document = Document.new(document_params)
    if @document.save
      redirect_to admin_documents_path, notice: t('message.created')
    else
      render :new
    end
  end

  def update
    if @document.update(document_params)
      redirect_to admin_documents_path, notice: t('message.updated')
    else
      render :show
    end
  end

  def sort
    params[:document].each_with_index do |id, index|
      Document.where(id: id).update_all(position: index + 1)
    end
  end

  def destroy
    if @document.destroy
      redirect_to admin_documents_path, notice: t('message.deleted')
    else
      redirect_to admin_documents_path, alert: t('message.something_wrong')
    end
  end

  private

    def document_params
      params.require(:document).permit(
      	:name, :file, :file_cache
      )
    end

    def set_document
      @document = Document.find(params[:id])
    end
end