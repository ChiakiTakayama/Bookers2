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
    else
      @books = Book.all
      @user = current_user #/books/indexのusers/user-infoでuser :@userの設定がされているのに
    #   コントローラーでこの記述がないからNoMethodErrorが
      render :index
    end
end
# 10章を元に作成

def index
  @books = Book.all
  @user = current_user
  @book =  Book.new
end
# 11章を元に記述。
# strongパラメーターより先に記述しないとエラーが出る
def show
 @bookfind = Book.find(params[:id])
 @user = @bookfind.user
 @book = Book.new
end
# 11章でログイン後の遷移より先に12章を元に記述

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
