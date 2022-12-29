Rails.application.routes.draw do
 root 'homes#top'
 
 get 'books/new'
 post 'books'=>'books#create'
 get 'books'=>'books#index'
 get 'books/:id'=>'books#show', as:'book' #'books/:id'というリンクにアクセスしたら'books#show'を表示しますよってこと？名前付きパスはbook
 get 'books/:id/edit'=>'books#edit', as: 'edit_book'
 patch 'books/:id'=>'books#update' , as: 'update_book'
 delete 'books/:id'=>'books#destroy', as: 'destroy_book'
 
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 get 'top'=>'homes#top'
end
