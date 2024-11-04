class Admin::BaseController < ApplicationController
  before_action :authenticate_admin!
  layout "admin/dashboard"

  def restrict_access(resource)
    redirect_to admin_root_path, notice: t('resource_permissions.access_denied') unless current_admin.permitted?(resource)
  end

end