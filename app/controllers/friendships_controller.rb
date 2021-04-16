class FriendshipsController < ApplicationController

  def create
    @friendship = Friendship.new(friendships_params)
    @friendship.friend_id = params[:user_id]

    redirect_to root_path if @friendship.save
  end

  private

  def friendships_params
    params.require(:friendship).permit(:user_id, :confirmed)
  end
end