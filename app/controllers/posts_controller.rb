class PostsController < ApplicationController
  before_action :move_to_index, except: [:index, :show]
  before_action :set_post, only: [:show, :edit]

  
  def index
    @posts = Post.all.order("created_at DESC")
    # @posts = Post.include(:user)
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user).order("created_at DESC")
  end

  def destroy
    post = Post.find(params[:id])
    if post.destroy
      redirect_to root_path
    else
      render :show
    end
  end

def edit
end

def update
  post = Post.find(params[:id])
  if post.update(post_params)
    redirect_to root_path
  else
    render :edit
  end
end
  
private

def post_params
params.require(:post).permit(:image, :title, :text).merge(user_id: current_user.id)
end

def move_to_index
  unless user_signed_in?
    redirect_to action: :index
  end
end

def set_post
  @post = Post.find(params[:id])
end

end
