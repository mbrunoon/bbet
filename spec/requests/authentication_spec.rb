require 'rails_helper'

RSpec.describe "Authentications", type: :request do

  before(:all) do
    @user = User.create(:username => "authentications", :email => "authentications@test.com", :password => "9digitspassword")
  end

  let(:valid_headers) do
    {
      content_type: "application/json; charset=utf-8"
    }
  end


  describe "/auth/login" do
    
    it "valid authentication" do
      post auth_login_url, params: { :email => @user.email, :password => "9digitspassword" }, headers: valid_headers, as: :json
    end

  end

end
