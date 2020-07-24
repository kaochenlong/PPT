Rails.application.routes.draw do
  root "boards#index"
  get "/about", to: "pages#about"

  resources :boards
end
