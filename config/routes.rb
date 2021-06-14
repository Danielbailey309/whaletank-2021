Rails.application.routes.draw do
  devise_for :members
  root to: "companies#index"
  resources :companies, :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
