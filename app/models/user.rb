class User < ApplicationRecord
  has_many :posts
  has_many :likes

  has_many :edited_bies
  has_many :edited_posts, through: :edited_bies, source: :post
end
