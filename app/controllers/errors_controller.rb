class ErrorsController < ApplicationController
include SlackNotifier
before_action :notify

  def show
    render "#{status_code.to_s}.html", :status => status_code
  end

  protected

  def status_code
    params[:code] || 500
  end

end

