class FriendshipsController < ApplicationController

  def show
    @friendship = Friendship.find(params[:id])
  end 

  def create
    @friendship = current_user.friendships.create(friend_id: params[:user_id], confirmed: false)
    redirect_to users_path if @friendship.save
  end

  def update
    @friendship = Friendship.find(params[:id])
    @friendship.confirm_friend
    redirect_to current_user
  end

  def delete
    @friendship = Friendship.find(params[:id])
    Friendship.destroy(@friendship.id)
    redirect_to root_path 
  end 

end