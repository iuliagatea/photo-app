class UsersController < ApplicationController
  def my_friends
    @friendships = current_user.friends
  end
  def search
    @users = User.search(params[:search_param])
    render json: @users
  end
end