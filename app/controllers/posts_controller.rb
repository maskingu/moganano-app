class PostsController < ApplicationController
  before_action :move_to_index, except: [:index, :show, :search]
  before_action :set_post, only: [:show, :edit]

  
  def index
    @posts = Post.includes(:user).order("created_at DESC")

  end

  def new
    @post = PostsTag.new
  end

  def create

    @post = PostsTag.new(posts_tag_params)
    if @post.valid?
      @post.save
      return redirect_to root_path
    else
      render "new"
    end
    
  end

  def show
    @comment = Comment.new
    @comments = @post.comments.includes(:user).order("created_at DESC")
  end

  def search
    @posts = Post.search(params[:keyword])
    
    return nil if params[:input] == ""
    tag = Tag.where(['name LIKE ?', "%#{params[:input]}%"] )
    render json:{ keyword: tag }
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
  @post = Post.find(params[:id])
  if @post.update(post_params)
    redirect_to root_path
  else
    render :edit
  end
end
  
private

def post_params
params.require(:post).permit(:image, :title, :text, :name, :comment).merge(user_id: current_user.id)
end

def posts_tag_params
  params.require(:posts_tag).permit(:image, :title, :text, :name, :comment).merge(user_id: current_user.id)
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
