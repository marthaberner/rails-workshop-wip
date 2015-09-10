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
      redirect_to posts_path
    else
      render :new
    end

    ### Demo why we have duplicates by going into rails c - show how to validate uniqueness in the model
  end

  private

  def post_params
    params.require(:post).permit(:title, :author, :body)
  end

end
