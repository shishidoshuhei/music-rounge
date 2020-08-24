class ApplicationController < ActionController::Base
  # デバイスでnameカラムを使えるようにする
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search
  protected
  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end

  def after_sign_out_path_for(resource)
    new_user_session_path
  end
  def set_search
  	@posts = Post.page(params[:page]).reverse_order
  	@search = @posts.ransack(params[:q])
  end
end
