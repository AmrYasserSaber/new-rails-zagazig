class Post < ApplicationRecord
  belongs_to :user

  has_many :likes

  has_many :edited_bies
  has_many :editors, through: :edited_bies, source: :user
end
