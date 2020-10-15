class Post < ApplicationRecord
  validates :text, :title, :image, presence: true

  belongs_to :user
end
