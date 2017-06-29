require "rails_helper"

RSpec.describe StaticPagesController, type: :controller do
  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #home" do
    it "returns http success" do
      get :home
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end
end
