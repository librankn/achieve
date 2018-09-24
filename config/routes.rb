Rails.application.routes.draw do

  resources :sessions,only:[:new,:create,:destroy]
  resources :users, only: [:new,:create]
  resources :records do
    collection do
      post :confirm
      get :top
    end
  end
end
