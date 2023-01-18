class BooksController < ApplicationController
  def new
   # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
   # @book = Book.new
  end
  
  def create
   # 手順①
   # book  = Book.new(book_params) #データの受け取り、新規登録する [引数：モデル名_params]
   # # 受け取ったデータをビューファイルに受け渡す必要がないので「＠」はつかない[ローカル変数]
   
   # book.save #データをデータベースに保存する[saveメゾット]
   # redirect_to '/books' #/booksにリダイレクト
   
   
   # 手順② バリデーションの結果をコントローラで検出
    # @book = Book.new(book_params)
    # if @book.save
    #  redirect_to '/books'
    # else
    #  render :index
    # end
   
    
   # 手順③ 保存した後にフラッシュメッセージを表示
   @book = Book.new(book_params)
   if @book.save
    flash[:notice] = "Book was successfully created."
    redirect_to book_path(@book.id) #セーブできた時
    # NEXT Viewファイル（今回はShow.html.erb）に記述。
   else
    @books = Book.all # この行を追加 
    # index.html.erbの<% @books.each do |book| %>に対してのエラー解決
    # 代入をしていない＠bookインスタンス変数はnilが入る
    # [原因]代入していないものに対してメゾットを使い呼び出していたこと。
    flash[:alret] = "Book was not successfully created." # セーブできなかった時
    render :index
   end
  end

  def index
   @books = Book.all
   @book = Book.new
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
   
  end
  
  def update
   @book = Book.find(params[:id])
   if @book.update(book_params)
    flash[:notice] = "Book was successfully created."
    redirect_to book_path(@book.id)
   else
    render :edit
   end
  end
  
  def destroy
   @books = Book.all
   @book = Book.find(params[:id]) # データ（レコード）を１件取得
   @book.destroy # データ（レコード）を削除
   # flash[:notice] = "Book was successfully destroyed."
   redirect_to '/books', alert: 'Book was successfully destroyed.' #index画面に戻る
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
