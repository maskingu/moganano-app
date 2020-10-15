class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    Post.create(post_params)
  end

  def show
    @post = Post.find(params[:id])
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
  @post = Post.find(params[:id])
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
params.require(:post).permit(:image, :title, :text)
end

end
