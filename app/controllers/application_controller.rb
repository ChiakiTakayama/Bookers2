class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
# サインインしたらユーザーページに飛ぶようにする
  # def new
    # @book = Book.new
  # end
# 10章を元に作成

# def create
    # @book = Book.new(book_params)
    # @book.book_id = current_user.id
    # @book.save
    # redirect_to book_path
# end
# 10章を元に作成

  def after_sign_in_path_for(resource)
    about_path
  end
# サインアウトしたらトップページに飛ぶようにする
  def after_sign_out_path_for(resource)
    about_path
  end

# private
# def user_params
    # params.require(:user).permit(:title, :body)
# endprivate

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
