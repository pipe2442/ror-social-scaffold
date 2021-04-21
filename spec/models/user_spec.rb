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
end
