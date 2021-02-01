Rails.application.routes.draw do
 
 
  devise_for :users
  root to: "home#index"
  resources :users
  resources :rooms do
    get :search, on: :collection
    resources :books 
  end
end