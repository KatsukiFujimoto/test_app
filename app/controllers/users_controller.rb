class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.desc_order.paginate(page: params[:page], per_page: 20)
  end
end
