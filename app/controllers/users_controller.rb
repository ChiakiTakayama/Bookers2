class UsersController < ApplicationController
  # 15章を元に記述
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new#途中で誤って消してしまった。githubを参考に記述した。
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
   @user = User.find(params[:id])
   if @user.update(user_params)
    redirect_to user_path(@user.id)
   else
     render :edit
   end
  end

  def index
    @users = User.all
    @user = current_user
    @book = Book.new
  end
  # アプリケーションを完成させよう1の3章を元に
  # user一覧を作成する
  # ルーティングはほぼおkっぽいからあとはユーザー画像、Showへのリンク作成

  private
  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
