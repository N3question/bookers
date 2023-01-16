class BooksController < ApplicationController
  def new
   # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
   @book = Book.new
  end
  
  def create
   book  = Book.new(book_params) #データの受け取り、新規登録する [引数：モデル名_params]
   # 受け取ったデータをビューファイルに受け渡す必要がないので「＠」はつかない[ローカル変数]
   
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
   @book = Book.find(params[:id]) 
    # 一件だけ取得するのでインスタンス変数は単数形の＠book
    # [findメゾット]は引数を受け取り、例えばidカラムを引数と比べてレコードを取得する
    # (例) Book.find(1) booksテーブルの中にあるidが1のレコードを取得
  end

  def edit #編集機能のためのアクション
   @book = Book.find(params[:id]) 
    # [findメゾット]今回は投稿済みのデータを編集する。保存されているデータが必要なのでfindメゾットを使う。
    # NEXT editアクションに対するViewを開き、フォームを表示するための記述を行う。
    
    # redirect_to book_path(@book.id)
    # 編集後詳細画面へリダイレクト
  end
  
  def update
   book = Book.find(params[:id])
   book.update(book_params)
   redirect_to book_path(book.id)
   
  end
  
  def destroy
   book = Book.find(params[:id]) # データ（レコード）を１件取得
   book.destroy # データ（レコード）を削除
   redirect_to '/books' #index画面に戻る
   # NEXT destroyアクションへのリンクをindex.html.erbに作成する(実際に削除するボタン)
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
