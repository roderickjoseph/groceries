require 'rails_helper'

RSpec.describe ListsController, type: :controller do
  describe 'lists#index action' do
    it 'should successfully show the page' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'lists#new action' do
    it 'should successfuly show the new form' do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'lists#create action' do
    it 'should successfully create a new list in our database' do
      post :create, params: { list: { title: 'Test' } }
      expect(response).to redirect_to root_path

      list = List.last
      expect(list.title).to eq('Test')
    end

    it 'should properly deal with validation errors' do
      post :create, params: { list: { title: '' } }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(List.count).to eq 0
    end
  end
end
