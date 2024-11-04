class Admin::SpacesController < Admin::BaseController
	before_action :set_space, only: [:show, :edit, :update, :destroy]

  def index
  	@spaces = Space.all
	end

	def show; end

	def new
		@space = Space.new
	end

	def create
		extract_amount
		@space = Space.new(space_params)
	  if @space.save
        redirect_to admin_space_path(@space, tab: params[:tab]), notice: t('message.created')
	  else
	    render :new
	  end
	end

	def update
		extract_amount
	  if @space.update(space_params)
	    redirect_to admin_space_path(@space, tab: params[:tab]), notice: t('message.updated')
	  else
	    render :edit
	  end
	end

	def destroy
		if @space.destroy
	  	redirect_to admin_spaces_path, notice: t('message.deleted')
	  else
	  	redirect_to admin_spaces_path, alert: t('message.something_wrong')
	  end
	end

  private

	def extract_amount
		params[:space][:book_price_cents] = params[:space][:book_price_cents].to_s.gsub('.', '').gsub(',', '').to_i
		params[:space][:rent_price_cents] = params[:space][:rent_price_cents].to_s.gsub('.', '').gsub(',', '').to_i
	end

  def set_space
    @space = Space.find(params[:id])
  end

  def space_params
    params.require(:space).permit(
			:name, :book_price_cents, :rent_price_cents, :surface_area,
			:description, :bookable, :rentable, :available, :bookable_from, :bookable_to,
			space_images_attributes: [
				:id, :image, :image_cache, :position, :_destroy
			]
		)
  end	
end
