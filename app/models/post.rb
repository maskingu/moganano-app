class Post < ApplicationRecord
  validates :text, :title, :image, presence: true

  belongs_to :user
  has_one_attached :image
end
