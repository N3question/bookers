Rails.application.routes.draw do
 root 'homes#top'
 get 'books/new'
 post 'books'=>'books#create'
 get 'books'=>'books#index'
 get 'books/:id'=>'books#show'
 get 'books/edit'=>'books#edit'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 get 'top'=>'homes#top'
end
