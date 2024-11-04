class Admin::FaqsController < Admin::BaseController
	before_action :set_faq, only: [:show, :update, :destroy]

	def index
		@faqs = Faq.all
	end

	def show; end

	def new
		@faq = Faq.new
	end

	def create
		@faq = Faq.new(faq_params)
		if @faq.save
			redirect_to [:admin, :faqs], notice: t('message.created')
		else
			render :new
		end
	end

	def update
		if @faq.update(faq_params)
			redirect_to [:admin, :faqs], notice: t('message.updated')
		else
			render :show
		end
	end
	
	def destroy
		if @faq.destroy
			redirect_to [:admin, :faqs], notice: t('message.deleted')
		else
			redirect_to [:admin, :faqs], alert: t('message.something_wrong')
		end
	end

  def sort
    params[:faq].each_with_index do |id, index|
      Faq.where(id: id).update_all(position: index + 1)
    end
  end

  private

  def faq_params
  	params.require(:faq).permit(:question, :answer)
  end

  def set_faq
  	@faq = Faq.find(params[:id])
  end
end