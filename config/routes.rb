Rails.application.routes.draw do
  root "boards#index"
  get "/about", to: "pages#about"

  resources :boards do
    resources :posts, shallow: true
  end
end
