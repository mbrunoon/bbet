require 'rails_helper'

RSpec.describe "/techniques", type: :request do

  before(:all) do
    @group = Group.create(:name => "Nage-waza")
    @user = User.create(:username => "techniques", :email => "techniques@test.com", :password => "9digitspassword")
    @token = JsonWebToken.encode(user_id: @user.id)
  end

  let(:valid_headers) {
    {
      "content-type" => "application/json; charset=utf-8",
      "Authorization" => "Bearer #{@token}"
    }
  }

  let(:valid_attributes) {
    {
      :name => "O-soto-gari",
      :url => "https://www.youtube.com/watch?v=c-A_nP7mKAc",
      :group => @group
    }
  }

  let(:invalid_attributes) {
    {
      :name => "",
      :url => "",
      :group => 0
    }    
  }

  describe "GET /index" do
    it "renders a successful response" do
      Technique.create! valid_attributes
      get techniques_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      technique = Technique.create! valid_attributes
      get technique_url(technique), headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

end
