class PostsController < ApplicationController
  def index
    @posts = Post.all.zip Advertisement.all
    @posts.each do |post, ad|
      puts ad.price
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
  end

  def edit
  end
end
