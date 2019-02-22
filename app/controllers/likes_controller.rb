class LikesController < ApplicationController
  before_action :find_likable

  def create
    @like = current_user.likes.create!(likes_params)
    @likable.reload
  end

  def destroy
    like = Like.find(params[:id])
    like.destroy
    @likable.reload
  end

  private

    def find_likable
      @likable = Post.find(params[:likable_id]) if params[:likable_type] == 'Post'
      @likable = Comment.find(params[:likable_id]) if params[:likable_type] == 'Comment'
    end

    def likes_params
      params.permit(:likable_id, :likable_type)
    end
end
