require 'rails_helper'

RSpec.describe User, type: :model do
  
  before(:all) do
    @user = User.create(:username => "user", :email => "user@test.com", :password => "9digitspassword")
  end

  describe "creating valid user" do
    
    it "new valid user" do
      user = User.new(:username => "user2", :email => "user2@test.com", :password => "9digitspassword")
      expect(user).to be_valid
    end
    
  end

  describe "validations test" do

    it "presence and uniqueness email" do
      user = User.new(:username => "user3", :email => "", :password => "9digitspassword")
      expect(user).to_not be_valid "email blank"
      user.email = "user@test.com"
      expect(user).to_not be_valid "email already exists"
    end

    it "email format" do
      user = User.new(:username => "user2", :email => "user2teste", :password => "9digitspassword" )
      expect(user).to_not be_valid "email format invalid"
      user.email = "user.teste"
      expect(user).to_not be_valid "email format invalid"
      user.email = "user@"
      expect(user).to_not be_valid "email format invalid"
    end

    it "username presence" do
      user = User.new(:email => "user@test.com", :password => "9digitspassword" )
      expect(user).to_not be_valid "username blank"
    end

  end

end
