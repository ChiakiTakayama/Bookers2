class Book < ApplicationRecord

  belongs_to :user
  validates :title, presence: true
  validates :body, presence: true, length: {maximum: 200}

  # def get_image
  #   if image.attached?
  #     image
  #   else
  #     'no_image.jpeg'
  #   end
  # end
# 11章を元に記述したが、投稿したユーザーの画像を出すだけなら
# def get_image〜endの記述はuserモデルの方でするのでいらない。
end