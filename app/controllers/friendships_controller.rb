class FriendshipsController < ApplicationController

  def show
    @friendship = Friendship.find(params[:id])
  end 

  def create
    @friendship = Friendship.new(friendships_params)
    @friendship.friend_id = params[:user_id]

    redirect_to root_path if @friendship.save
  end

  def update
    @friendship = Friendship.update(confirmed: true)
    redirect_to root_path 
  end

  def destroy
    Friendship.find(params[:id])
    @friendship = Friendship.destroy
    redirect_to root_path 
  end 

  private

  def friendships_params
    params.require(:friendship).permit(:user_id, :confirmed)
  end
end