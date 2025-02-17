module ApplicationHelper
  def menu_link_to(link_text, link_path)
    class_name = current_page?(link_path) ? 'menu-item active' : 'menu-item'

    content_tag(:div, class: class_name) do
      link_to link_text, link_path
    end
  end

  def like_or_dislike_btn(post)
    like = Like.find_by(post: post, user: current_user)
    if like
      link_to('Dislike!', post_like_path(id: like.id, post_id: post.id), method: :delete)
    else
      link_to('Like!', post_likes_path(post_id: post.id), method: :post)
    end
  end

  def verify_friendship(friend_id)
    Friendship.where('(user_id = ? and friend_id = ?) OR (user_id = ? and friend_id = ?)',
                     current_user.id, friend_id, friend_id, current_user.id).first
  end

  def add_friend(user)
    if current_user.friend?(user)
      tag.h3 'You are friends!'
    elsif user.friend_requests.include?(current_user) or user.pending_friends.include?(current_user)
      tag.h3 'Pending request'
    elsif current_user == user
      tag.h3 ' '
    else
      button_to 'Add Friend', user_friendships_path(user), method: :post
    end
  end
end
