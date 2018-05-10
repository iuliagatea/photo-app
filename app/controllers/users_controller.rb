class UsersController < ApplicationController
  def my_friends
    @friendships = current_user.friends
  end
  def search_for_friends
    @friendships = current_user.friends
    if params[:search_param].blank?
      flash.now[:danger] = "You have entered an empty search string"
    else
      @users = User.search(params[:search_param])
      @users = current_user.except_current_user(@users)
      flash.now[:danger] = "No users match this search criteria" if @users.blank?
    end
  end
  def search
    redirect_to search_for_friends_path(request.parameters)
  end
  
  def add_friend
    @friend = User.find(params[:friend])
    current_user.friendships.build(friend_id: @friend.id)
    
    if current_user.save
      flash[:success] = "Friend was successfully added"
    else
      flash[:danger] = "There was something wrong with the friend request"
    end
    redirect_to my_friends_path
  end
  
  def show
    @user = User.find(params[:id])
    @users = @user.friends
    @images = @user.images
  end
end