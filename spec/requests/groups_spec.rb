require 'rails_helper'

RSpec.describe "/groups", type: :request do

  let(:valid_attributes) {
    {
      "name" => "Nage-waza"
    }
  }

  let(:invalid_attributes) {
    {
      "name" => "Nage-waza",
      "major_group" => 0
    }
  }

  let(:valid_headers) {
    {
      content_type: "application/json; charset=utf-8; charset=utf-8"
    }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Group.create! valid_attributes
      get groups_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      group = Group.create! valid_attributes
      get group_url(group), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Group" do
        expect {
          post groups_url,
               params: { group: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Group, :count).by(1)
      end

      it "renders a JSON response with the new group" do
        post groups_url,
             params: { group: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json; charset=utf-8"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Group" do
        expect {
          post groups_url,
               params: { group: invalid_attributes }, as: :json
        }.to change(Group, :count).by(0)
      end

      it "renders a JSON response with errors for the new group" do
        post groups_url,
             params: { group: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        {
          :name => "Katame-waza"
        }
      }

      it "updates the requested group" do
        group = Group.create! valid_attributes
        patch group_url(group),
              params: { group: new_attributes }, headers: valid_headers, as: :json
        group.reload
        expect(group.name).to eq("Katame-waza")
      end

      it "renders a JSON response with the group" do
        group = Group.create! valid_attributes
        patch group_url(group),
              params: { group: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json; charset=utf-8"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the group" do
        group = Group.create! valid_attributes
        patch group_url(group),
              params: { group: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq("application/json; charset=utf-8")
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested group" do
      group = Group.create! valid_attributes
      expect {
        delete group_url(group), headers: valid_headers, as: :json
      }.to change(Group, :count).by(-1)
    end
  end
end
