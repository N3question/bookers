Rails.application.routes.draw do
 # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 
 root 'homes#top'
 get 'top'=>'homes#top'
 get 'books/new'
 post 'books'=>'books#create'
 get 'books'=>'books#index'
 get 'books/:id'=>'books#show', as:'book' # 名前付きルート
  # 'books#show'の設定を、bookとして利用できる、という意味になる
  # NEXT indexのlink_toを変更
 get 'books/:id/edit'=>'books#edit', as:'edit_book'
 patch 'books/:id'=>'books#update', as:'update_book' # 編集したフォームとアクションを紐づけていく作業
  # NEXT updateのためのPATCH（HTTPメゾット）、update_book(名前付きルート)に設定しているので、その記述をフォームに追記
end
