class BooksController < ApplicationController
  # サインインしたらユーザーページに飛ぶようにする
 
 def new
    @book = Book.new
 end
# 10章を元に作成

def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to books_path
end
# 10章を元に作成
def index
  @books = Book.all
end
# 11章を元に記述。
# strongパラメーターより先に記述しないとエラーが出る
def show
 @book = Book.find(params[:id])
end
# 11章でログイン後の遷移より先に12章を元に記述
 private

 def book_params
   params.require(:book).permit(:title, :body)
 end

# 10章を元に作成

end
