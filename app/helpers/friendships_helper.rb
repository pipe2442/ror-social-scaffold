module FriendshipsHelper
    def friendship_button(user)
        if @friendship.confirmed
          tag.h3 'you are friends'
        else
          link_to 'Accept Friendship', friendship_path(friendship.id), method: :put
        end
    end
end
