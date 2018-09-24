Rails.application.routes.draw do
  resources :records do
    collection do
      post :confirm
      get :top
    end
  end
end
