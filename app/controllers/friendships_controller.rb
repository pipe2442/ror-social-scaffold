class FriendshipsController < ApplicationController

  def show
    @friendship = Friendship.find(params[:id])
  end 

  def create
    @friendship = current_user.friendships.create(friend_id: params[:user_id], confirmed: false)
    redirect_to root_path if @friendship.save
  end

  def update
    @friendship = Friendship.update(confirmed: true)
    redirect_to root_path 
  end

  def delete
    @friendship = Friendship.find(params[:id])
    Friendship.destroy(@friendship.id)
    redirect_to root_path 
  end 
  
  private

  def friendships_params
    params.require(:friendship).permit(:user_id, :confirmed)
  end

end