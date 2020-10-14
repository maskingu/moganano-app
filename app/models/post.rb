class Post < ApplicationRecord
  validates :text, :title, :image, presence: true
end
