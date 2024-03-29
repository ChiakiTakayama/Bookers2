class UsersController < ApplicationController
  # 15章を元に記述
  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
        render "edit"
    else
      redirect_to user_path(current_user)
    end
  end

  def update
   @user = User.find(params[:id])
   if @user.update(user_params)
     flash[:success] = "You have updated user successfully."
     redirect_to user_path(@user.id)
   else
     render :edit
   end
  end

  def index
    @user = current_user
    @users = User.all
    @book = Book.new
  end
  # アプリケーションを完成させよう1の3章を元にuser一覧を作成する
  
  private
  def user_params
    params.require(:user).permit(:name, :profile_image,:introduction)
  end
end
