Rails.application.routes.draw do
 root 'homes#top'
 get 'books/new'
 post 'books'=>'books#create'
 get 'books'=>'books#index'
 get 'books/:id'=>'books#show', as:'book' # 名前付きルート
  # 'books#show'の設定を、bookとして利用できる、という意味になる
  # NEXT indexのlink_toを変更
 get 'books/edit'=>'books#edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 get 'top'=>'homes#top'
end
