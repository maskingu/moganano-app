class Post < ApplicationRecord
  validates :text, presence: true
  has_many :post_tag_relations, dependent: :destroy
  has_many :tags, through: :post_tag_relations, dependent: :destroy
  belongs_to :user, optional: true
  has_one_attached :image
  has_many :comments

  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user

  def self.search(search)
    if search!= ""
      Post.where('text LIKE(?)',"%#{search}%")
    else
      Post.all
    end
  end
end
