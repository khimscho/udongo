class Backend::BaseController < ActionController::Base
  include Udongo::Cryptography

  layout 'backend/application'
  before_action :check_login

  def breadcrumb
    @breadcrumb ||= Udongo::Breadcrumb.new
  end
  helper_method :breadcrumb

  def current_admin
    @current_admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
  end
  helper_method :current_admin

  def translate_notice(notice, actor = nil)
    Udongo::Notification.new(notice).translate(actor)
  end

  def default_app_locale
    Udongo.config.i18n.app.default_locale
  end
  helper_method :default_app_locale

  private

  def check_login
    unless current_admin
      session[:backend_redirect] = request.url
      redirect_to new_backend_session_path
    end
  end
end
