require 'rails_helper'

RSpec.describe "Mains", type: :request do

  before(:all) do
    Rails.application.load_seed
    @groups = Group.where(major_group: nil)
  end

  let(:valid_headers) do
    {
      content_type: "application/json; charset=utf-8"
    }
  end

  describe "Get /index" do
    
    it "pageload success" do
      get root_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end

  end
end
