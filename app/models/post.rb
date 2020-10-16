class Post < ApplicationRecord
  validates :text, :title, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end

  belongs_to :user
  has_one_attached :image
end
