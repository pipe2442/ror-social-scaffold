require 'rails_helper'
require 'capybara/rspec'

RSpec.describe Like, type: :model do
  it 'is valid with valid attributes' do
    user = User.create(id: 1, name: 'name', email: 'email@testing.com', password: 'password')
    post = Post.create(id: 1, user_id: user.id, content: 'Single test content for post')
    expect(Like.new(id: 1, user_id: user.id, post_id: post.id)).to be_valid
  end

  it 'is not valid without a user' do
    user = User.create(id: 1, name: 'name', email: 'email@testing.com', password: 'password')
    post = Post.create(id: 1, user_id: user.id, content: 'Single test content for post')
    expect(Like.new(id: 1, user_id: nil, post_id: post.id)).to_not be_valid
  end

  it 'is not valid without a post' do
    user = User.create(id: 1, name: 'name', email: 'email@testing.com', password: 'password')
    expect(Like.new(id: 1, user_id: user.id, post_id: nil)).to_not be_valid
  end
end
