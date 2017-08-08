require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    it 'Has all the valid parameters to create a user' do
      @user = User.new(first_name: 'John',
                       last_name: 'Snow',
                       email: 'test@test.com',
                       password: 'password',
                       password_confirmation: 'password')
      expect(@user.valid?).to be true
    end

    it 'When Passwords dont match' do
      @user = User.new(first_name: 'John',
                       last_name: 'Snow',
                       email: 'test@test.com',
                       password: 'password',
                       password_confirmation: '123456')
      expect(@user.valid?).to be false
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'testing case sensitivity for email' do
      @user1 = User.new(first_name: 'John',
                        last_name: 'Snow',
                        email: 'test@test.com',
                        password: 'password',
                        password_confirmation: 'password')
      @user1.save
      @user2 = User.new(first_name: 'John',
                        last_name: 'Snow',
                        email: 'Test@test.com',
                        password: 'password',
                        password_confirmation: 'password')
      expect(@user2.save).to be false
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end

    it 'When First name is not included' do
      @user = User.new(last_name: 'Snow',
                       email: 'test@test.com',
                       password: 'password',
                       password_confirmation: 'password')
      expect(@user.valid?).to be false
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'When last name is not included' do
      @user = User.new(first_name: 'Snow',
                       email: 'test@test.com',
                       password: 'password',
                       password_confirmation: 'password')
      expect(@user.valid?).to be false
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'When email is not included' do
      @user = User.new(last_name: 'Snow',
                       first_name: 'test@test.com',
                       password: 'password',
                       password_confirmation: 'password')
      expect(@user.valid?).to be false
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'Password does not meet minimum length' do
      @user = User.new(first_name: 'John',
                       last_name: 'Snow',
                       email: 'test@test.com',
                       password: '123',
                       password_confirmation: '123')
      expect(@user.valid?).to be false
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 4 characters)")
    end
  end

  describe '.authenticate_with_credentials' do

    it 'when there are white spaces with the email' do
      @user = User.new(first_name: 'John',
                       last_name: 'Snow',
                       email: 'test@test.com',
                       password: 'asdasdasd',
                       password_confirmation: 'asdasdasd')
      @user.save
      expect(User.authenticate_with_credentials('test@test.com',@user.password)).to be_truthy
      # expect(@user.errors.full_messages).to include("Password is too short (minimum is 4 characters)")
    end
  end
end
