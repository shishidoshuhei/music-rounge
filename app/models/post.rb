class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites
  has_many :post_tags
  has_many :tags, through: :post_tags
  has_many :users, through: :favorites

  def favorited_by?(user)
  	favorites.where(user_id: user.id).exists?
  end
end