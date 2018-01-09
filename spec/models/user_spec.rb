require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'validations' do
    User.create(username: "username", password: "password")
    it { should validate_presence_of(:username) }
    it { should validate_uniqueness_of(:username) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:password_digest) }
    it 'Fails validation if password is less than 6 characters' do
      user = User.new(username: "username", password: "passw")
      user.valid?
      expect(user.errors[:password]).to include('is too short (minimum is 6 characters)')
    end
  end

  describe 'assocations' do
    it { should have_many(:goals) }
    it { should have_many(:comments) }
  end

  describe 'class methods' do
    it 'Can find by credentials' do
      user = User.create(username: "username1", password: "password")
      expect(user).to eq(User.find_by_credentials("username1", "password"))
    end
  end

end
