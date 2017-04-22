require 'rails_helper'

RSpec.describe ListsController, type: :controller do
  describe 'lists#index action' do
    it 'should successfully show the page' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'lists#new action' do
    it 'should require users to be logged in' do
      get :new
      expect(response).to redirect_to new_user_session_path
    end
    it 'should successfuly show the new form' do
      user = User.create(
        email:                 'test@gmail.com',
        password:              'testPassword',
        password_confirmation: 'testPassword'
      )
      sign_in user

      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe 'lists#create action' do
    it 'should require users to be logged in' do
      post :create, params: { list: { title: 'Test' } }
      expect(response).to redirect_to new_user_session_path
    end

    it 'should successfully create a new list in our database' do
      user = User.create(
        email:                 'test@gmail.com',
        password:              'testPassword',
        password_confirmation: 'testPassword'
      )
      sign_in user

      post :create, params: { list: { title: 'Test' } }
      expect(response).to redirect_to root_path

      list = List.last
      expect(list.title).to eq('Test')
      expect(list.user).to eq(user)
    end

    it 'should properly deal with validation errors' do
      user = User.create(
        email:                 'test@gmail.com',
        password:              'testPassword',
        password_confirmation: 'testPassword'
      )
      sign_in user

      post :create, params: { list: { title: '' } }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(List.count).to eq 0
    end
  end
end
