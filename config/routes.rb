Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'lists#index'
  resources :lists, only: %i[new create show] do
    resources :items, only: %i[new create]
  end
end
