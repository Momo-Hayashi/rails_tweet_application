class PostsController < ApplicationController
  before_action :set_post, only:[:show, :edit, :update, :destroy]
  def index
    @posts = Post.all
  end
  def new
    @post = Post.new
  end
  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to posts_path, notice: "送信されました！"
    else
      render :new
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "つぶやきを削除しました！"
  end
  def update
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end
  def set_post
    @post = Post.find(params[:id])
  end
end