# Base controller for all apps controllers
class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :run_my_worker

  # sets security-related headers automatically based on the configuration located on security_headers initializer
  # skip_before_filter :set_csp_header, :only => :tinymce_page
  ensure_security_headers

  def run_my_worker
    MyWorker.perform_async
  end
end
