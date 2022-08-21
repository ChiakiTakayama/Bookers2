class BooksController < ApplicationController
  # サインインしたらユーザーページに飛ぶようにする

 def new
    @book = Book.new
 end
# 10章を元に作成

def create
 @book = Book.new(book_params)
 @book.user_id = current_user.id
  if @book.save
   redirect_to book_path(@book.id)
   flash[:success]="You have created book successfully."
  else
   @books = Book.all
   @user = current_user 
   render :index
  end
end
# 10章を元に作成

def index
  @books = Book.all
  @user = current_user
  @book =  Book.new
  # @bookfind = Book.find(params[:id])
end

def show
 @bookfind = Book.find(params[:id])
 @user = @bookfind.user
 @book = Book.new
 @book.user_id = current_user.id
end
# 11章でログイン後の遷移より先に12章を元に記述

def edit
    @book = Book.find(params[:id])
    if @book.user == current_user
     render "edit"
    else
     redirect_to books_path
    end
end

def update
  @book = Book.find(params[:id])
 if @book.update(book_params)
  flash[:success] = "You have updated book successfully."
  redirect_to book_path(@book.id)
 else
  render :edit
 end
end
# 更新の際のバリデーションはupdateで記述する

def destroy
 @book = Book.find(params[:id])
 @book.destroy
 redirect_to '/books'
end
# 13章を元に記述
 private

 def book_params
   params.require(:book).permit(:title, :body)
 end

# 10章を元に作成

end