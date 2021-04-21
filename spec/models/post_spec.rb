require 'rails_helper'
require 'capybara/rspec'

RSpec.describe Post, type: :model do
  it 'is valid with valid attributes' do
    user = User.create(id: 1, name: 'name', email: 'email@testing.com', password: 'password')
    expect(Post.new(id: 1, user_id: user.id, content: 'Single test content for post')).to be_valid
  end

  it 'is not valid without a user' do
    expect(Post.new(id: 1, user_id: nil, content: 'Single test content for post')).to_not be_valid
  end

  it 'is not valid without content' do
    user = User.create(id: 1, name: 'name', email: 'email@testing.com', password: 'password')
    expect(Post.new(id: 1, user_id: user.id, content: nil)).to_not be_valid
  end

  it 'is not valid without user_id' do
    user = User.create(id: nil, name: 'name', email: 'email@testing.com', password: 'password')
    expect(Post.new(id: 1, user_id: user.id, content: nil)).to_not be_valid
  end
end
