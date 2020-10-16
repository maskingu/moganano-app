class Post < ApplicationRecord
  validates :text, :title, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end

  has_many :post_tag_relations
  has_many :tags, through: :tweet_tag_relations
  belongs_to :user
  has_one_attached :image
  has_many :comments

  def self.search(search)
    if search != ""
      Post.where('text LIKE(?)', "%#{search}%")
    else
      Post.all
    end
  end
end
