class PostsTag

  include ActiveModel::Model
  attr_accessor :text, :title, :name, :image, :user_id

  with_options presence: true do
    validates :text, :title, presence: true
    validates :name
  end


  

  def save
    post = Post.create(text: text, title: title, image: image, user_id: user_id)
    tag = Tag.where(name: name).first_or_initialize
    tag.save

    PostTagRelation.create(post_id: post.id, tag_id: tag.id)
  end
end