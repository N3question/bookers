class Book < ApplicationRecord
 # モデルのファイル（ここ）に設定内容を記述
 # 投稿に対して「必須入力」の設定が必要
 validates :title, presence: true
 validates :body, presence: true
 # NEXT 返されたバリデーションの結果を、コントローラで検出。Go to [controller.rb]
end
