class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites
  has_many :post_tag
  has_many :users, through: :favorites
end