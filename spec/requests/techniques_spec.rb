require 'rails_helper'


RSpec.describe "/techniques", type: :request do

  let(:valid_attributes) {
    {
      "name" => "O-soto-gari",
      "url"=> "https://www.youtube.com/watch?v=c-A_nP7mKAc"
    }
  }

  let(:invalid_attributes) {
    {
      "name" => "",
      "url" => ""
    }    
  }

  let(:valid_headers) {
    {
      "content-type" => "application/json"
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
      get technique_url(technique), as: :json
      expect(response).to be_successful
    end
  end

end
