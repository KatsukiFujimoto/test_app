class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]
  before_action :check_commentuser, only: :destroy
  before_action :find_commentable

  def new
    @comment = Comment.new
  end

  def create
    @comment = @commentable.comments.build(comment_params)
    if @comment.save
      redirect_to request.referer, notice: "The comment \"#{@comment.content}\" was successfully created"
    else
      render 'new'
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    post = comment.commentable
    comment.destroy
    redirect_to request.referer, notice: "The comment \"#{comment.content}\" was successfully deleted"
  end

  private

    def comment_params
      params[:comment][:user_id] = current_user.id
      params.require(:comment).permit(:content, :user_id)
    end

    def check_commentuser
      user = Comment.find(params[:id]).user
      redirect_to root_url, notice: "You can only delete your posts" unless current_user?(user)
    end

    def find_commentable
      @commentable = Comment.find(params[:comment_id]) if params[:comment_id]
      @commentable = Post.find(params[:post_id]) if params[:post_id]
    end
end
