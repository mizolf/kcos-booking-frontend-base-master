class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_current_admin_for_models, except: [:index, :show, :new, :edit]
  before_action :make_action_mailer_use_request_host_and_protocol
  
  helper_method :allow_previews?
  helper_method :hide_admin_hud?

  def allow_previews?
    !current_admin.nil? && !params[:visitor_view]
  end

  def hide_admin_hud?
    !params[:hide_hud].blank?
  end

  protected

    def default_url_options(options = {})
      {visitor_view: params[:visitor_view]}
    end

    def restrict_to_development
      head(:bad_request) unless Rails.env.development?
    end

	  def set_current_admin_for_models
	    Admin.current = current_admin
	  end

  private

	  def make_action_mailer_use_request_host_and_protocol
	    ActionMailer::Base.default_url_options[:protocol] = request.protocol
	    ActionMailer::Base.default_url_options[:host] = request.host_with_port
	  end

end
