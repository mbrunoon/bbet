require 'rails_helper'

RSpec.describe "Users", type: :request do

  before(:all) do 
    @user = User.create(:username => "users_request", :email => "users_request@test.com", :password => "9digitspassword")
    @token = JsonWebToken.encode(user_id: @user.id)
  end

  let(:valid_headers){
    {
      "content-type" => "application/json; charset=utf-8",
      "Authorization" => "Bearer #{@token}"
    }    
  }

  describe "GET /show" do
    it "user details" do
      # get "/users/#{@user.username}", headers: valid_headers, as: :json
      get user_path(_username: @user.username), headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end
end
