class BooksController < ApplicationController
  def new
   # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
   @book = Book.new
  end
  
  def create
   book  = Book.new(book_params) #データの受け取り、新規登録する[インスタンス変数]
   book.save #データをデータベースに保存する[saveメゾット]
   redirect_to '/books' #/booksにリダイレクト
   
    # @book = Book.new(books_path)
    # if @book.save
    # redirect_to '/books'
    # else
    #   render :index
    # end
  end

  def index
   @books = Book.all
  end

  def show
   @book = Book.find(params[:id]) #一件だけ取得するのでインスタンス変数は＠book
  end

  def edit
  end
  
  def destroy
  end
  
private # controllerの中でしか呼び出せない
# 以下ストロングパラメータの定義
 def book_params
  params.require(:book).permit(:title, :body)
  # formから送られるデータ => paramsの中
  # 送られてきたデータの中からモデル（:book）を指定。データの絞り込み => require
  # 絞り込んだデータから保存を許可するカラム（:title :bodyなど）を指定 => permit
 end
  
end
