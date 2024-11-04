class Admin::AdminsController < Admin::BaseController
  before_action :set_admin, only: [:show, :edit, :update, :destroy]
  before_action do
    restrict_access(:admin_accounts) unless check_if_self
  end

  def index
    @admins = Admin.all
  end

  def show
    @admin = Admin.find(params[:id])
  end

  def new
    @admin = Admin.new
  end

  def create
    @admin = Admin.new(admin_params)
    @admin.password = @admin.password_confirmation = String.random
    @token = Devise.token_generator.generate(Admin, :reset_password_token)
    @admin.reset_password_token = @token.last
    @admin.reset_password_sent_at = Time.now.utc
    if @admin.save
      AdminMailer.send_credentials(@admin, @token.first).deliver_now
      redirect_to admin_admins_path, notice: t('message.created')
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @admin.update(admin_params)
      sign_in(@admin, bypass: true) unless current_admin != @admin
      redirect_to admin_admins_path, notice: t('message.updated')
    else
      render 'edit'
    end
  end

  def destroy
    if @admin.destroy
      redirect_to admin_admins_path, notice: t('message.deleted')
    else
      redirect_to admin_admins_path, alert: t('message.something_wrong')
    end
  end

  private

    def admin_params
      params.require(:admin).permit(:email, :image, :first_name, :last_name, :password, :password_confirmation, :admin, resource_permissions_attributes: [:id, :resource, :permitted])
    end

    def set_admin
      @admin = Admin.find(params[:id])
    end

    def check_if_self
      return false if current_admin.id != params[:id].to_i
      return false if action_name != "edit" && action_name != "update"
      true
    end

end