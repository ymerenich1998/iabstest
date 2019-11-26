class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post_path(@post.id)
    else
      render 'new'
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post.id)
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
      @post.destroy
      redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end

end
