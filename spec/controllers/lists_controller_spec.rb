require 'rails_helper'

RSpec.describe ListsController, type: :controller do
  describe 'lists#index action' do
    it 'should successfully show the page' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
end
