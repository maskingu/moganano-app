class Post < ApplicationRecord

  has_many :post_tag_relations
  has_many :tags, through: :post_tag_relations
  belongs_to :user
  has_one_attached :image
  has_many :comments
  has_many :likes, dependent: :destroy

  def self.search(search)
    if search != ""
      Post.where('text LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end
end
