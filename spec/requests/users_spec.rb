require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do
    it "signed_in successfully" do
      get new_user_session_path
      expect(response).to have_http_status(200)
    end

    it "signed_up successfully" do
      get new_user_registration_path
      expect(response).to have_http_status(200)
    end
  end
end
