Rails.application.routes.draw do
  root "pages#index"
  get "/about", to: "pages#about"

  resources :boards do
    resources :posts, shallow: true
  end

  resources :users, only: [:create] do
    collection do
      get :sign_up
      get :edit
      patch :update
      get :sign_in
      post :login
      delete :sign_out
    end
  end
end
