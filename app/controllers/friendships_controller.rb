class FriendshipsController < ApplicationController
  def new
    @friendship = Friendship.new
  end

  def create
    @friendship = current_user.friendships.new(friend_id: params[:friend_id], confirmed: false
    redirect_to users_path if @friendship.save
  end

  private

  def friendships_params
    params.require(:friendship).permit(:user_id, :friend_id, :confirmed)
  end
end