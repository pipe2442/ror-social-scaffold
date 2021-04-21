require 'rails_helper'
require 'capybara/rspec'

RSpec.describe Friendship, type: :model do
  it 'is valid with valid attributes' do
    user = User.create(id: 1, name: 'name', email: 'email@testing.com', password: 'password')
    friend = User.create(id: 2, name: 'name', email: 'email_friend@testing.com', password: 'password')
    expect(Friendship.new(user_id: user.id, friend_id: friend.id, confirmed: true)).to be_valid
  end

  it 'is not valid without a user' do
    friend = User.create(id: 2, name: 'name', email: 'email_friend@testing.com', password: 'password')
    expect(Friendship.new(user_id: nil, friend_id: friend.id)).to_not be_valid
  end

  it 'is not valid without a friend' do
    user = User.create(id: 1, name: 'name', email: 'email@testing.com', password: 'password')
    expect(Friendship.new(user_id: user.id, friend_id: nil)).to_not be_valid
  end
end
