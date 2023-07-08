require 'rails_helper'

RSpec.describe "Groups", type: :request do
  describe "GET /groups" do
    it 'redirects to sign-in button if user is not logged in' do
      get groups_path
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
