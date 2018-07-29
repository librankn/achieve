Rails.application.routes.draw do
  resources :records do
    collection do
      post :confirm
    end
  end
end
