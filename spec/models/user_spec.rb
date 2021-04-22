# spec/models/user_spec.rb

require 'rails_helper'
require 'capybara/rspec'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    expect(User.new(name: 'name', email: 'email@testing.com', password: 'password')).to be_valid
  end

  it 'is not valid without a name' do
    user = User.new(name: nil, email: 'email@testing.com', password: 'password')
    expect(user).to_not be_valid
  end

  it 'is not valid without a email' do
    user = User.new(name: 'name', email: nil, password: 'password')
    expect(user).to_not be_valid
  end

  it 'is not valid without a password' do
    user = User.new(name: 'name', email: 'email@testing.com', password: nil)
    expect(user).to_not be_valid
  end

  it 'includes friend on .friends user bidirectional helper method' do
    user = User.create(id: 1, name: 'name', email: 'email@testing.com', password: 'password')
    friend = User.create(id: 2, name: 'name', email: 'friend_email@testing.com', password: 'password')
    Friendship.create(user_id: user.id, friend_id: friend.id, confirmed: true)
    expect(user.friends).to include(friend)
  end

  it 'includes user on .friend friend bidirectional helper method' do
    user = User.create(id: 1, name: 'name', email: 'email@testing.com', password: 'password')
    friend = User.create(id: 2, name: 'name', email: 'friend_email@testing.com', password: 'password')
    Friendship.create(user_id: friend.id, friend_id: user.id, confirmed: true)
    expect(friend.friends).to include(user)
  end

  it 'expects friend?(friend) to return true' do
    user = User.create(id: 1, name: 'name', email: 'email@testing.com', password: 'password')
    friend = User.create(id: 2, name: 'name', email: 'friend_email@testing.com', password: 'password')
    Friendship.create(user_id: user.id, friend_id: friend.id, confirmed: true)
    expect(user.friend?(friend)).to be(true)
  end

  it 'has many inverse friendships' do
    should respond_to(:inverse_friendships)
  end

  it 'has many friendships' do
    should respond_to(:friendships)
  end
end
