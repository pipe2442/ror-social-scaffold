class FriendshipsController < ApplicationController
  def new
    @friendship = Friendship.new
  end

  def create
    @friendship = Friendship.new(user_id: current_user, friend_id: params[:friend_id], confirmed: false)
    redirect_to root_path if @friendship.save
  end

  private

  def friendships_params
    params.require(:friendship).permit(:user_id, :friend_id, :confirmed)
  end
end