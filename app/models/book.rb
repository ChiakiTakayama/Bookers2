class Book < ApplicationRecord
  # has_one_attached :image
  # 本の画像は投稿しないからいらない気がする
  belongs_to :user
  validates :title, presence: true
  validates :body, presence: true
  validates :image, presence: true
  
#   def get_image
    # if image.attached?
    #   image
    # else
    #   'no_image.jpg'
    # end
#   end
# 11章を元に記述したが、投稿したユーザーの画像を出すだけなら
# def get_image〜endの記述はuserモデルの方でするのでいらない。
end