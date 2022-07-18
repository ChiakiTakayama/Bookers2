class UsersController < ApplicationController
  # 15章を元に記述
  def show
    @user = User.find(params[:id])
    @books = @user.books
  end
  
  def edit
  end
end
