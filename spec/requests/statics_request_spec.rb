require 'rails_helper'

RSpec.describe "Statics", type: :request do

  describe "GET /fake_root" do
    it "returns http success" do
      get "/statics/fake_root"
      expect(response).to have_http_status(:success)
    end
  end

end
