class LikesController < ApplicationController

  before_action :set_valiables

  def like
    Like = current_user.likes.new(post.id: @post.id)
    like.save
  end

  def unlike
    like = current_user.likes.find_by(post.id: @post.id)
    like.destroy
  end

  private

  def set_valiables
    @post = Post.find(params[:post_id])
    @id_name = "#like-link-#{@post.id}"
  end

end
