class Book < ApplicationRecord
  # has_one_attached :imageっている？
  # 本の画像は投稿しないからいらない気がする
  belongs_to :user
end
