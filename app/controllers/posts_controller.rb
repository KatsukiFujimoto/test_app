class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]
  before_action :check_postuser, only: :destroy

  def index
    @posts = Post.all.desc_order.paginate(page: params[:page], per_page: 20)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to root_url, notice: "The post \"#{post.content}\" was successfully created"
    else
      render 'new'
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_url, notice: "The post \"#{post.content}\" was successfully deleted"
  end

  private

    def post_params
      params.require(:post).permit(:content)
    end

    def check_postuser
      user = Post.find(params[:id]).user
    redirect_to root_url, notice: "You can only delete your posts" unless current_user?(user)
    end
end
