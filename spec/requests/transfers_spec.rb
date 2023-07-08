require 'rails_helper'

RSpec.describe 'Transfers', type: :request do
  describe 'GET /transfers' do
    it 'renders successful response' do
      get authenticated_root_path
      expect(response).to have_http_status(200)
    end
  end
end
