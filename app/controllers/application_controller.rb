class ApplicationController < ActionController::Base
  before_action :authenticate_user!, except: [:top]
  before_action :configure_permitted_parameters, if: :devise_controller?
# サインインしたらユーザーページに飛ぶようにする

  def after_sign_in_path_for(resource)
    # about_path
    users_path   #books_pathにしてみたらうまく行ったのでもう少しユーザーページを見るべき
  end
# サインアウトしたらトップページに飛ぶようにする
  def after_sign_out_path_for(resource)
    about_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  
  # private
  
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up,keys:[:name])
  # end
end
