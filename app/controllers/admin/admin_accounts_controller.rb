class Admin::AdminAccountsController < Admin::BaseController
	before_action :set_admin

	def show; end

	def update
		if @admin.update_with_password(admin_params)
	    sign_in(@admin, bypass: true) unless current_admin != @admin
			redirect_to admin_root_path, notice: t('message.updated')
		else
			render 'show'
		end
	end

	private

	def set_admin
		@admin = current_admin
	end

    def admin_params
    	params.require(:admin).permit(
    		:email, :image, :first_name, :last_name, :password,
    		:password_confirmation, :current_password
    	)
    end

end