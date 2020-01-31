class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @comment = @post.comments.build
    @comment.user = User.new
  end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @post.categories.build
  end

  def create
    post = Post.new(post_params)
    if post.save
      redirect_to post
    else 
      render :'posts/new'
    end
  end

  def update 
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to post_path(@post)
    else 
      render :'posts/new'
    end

  end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name])
  end
end
