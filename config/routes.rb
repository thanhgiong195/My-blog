Rails.application.routes.draw do
  root to: "static_pages#home"
  get "index", to: "static_pages#index"
  get "about", to: "static_pages#about"
  get "contact", to: "static_pages#contact"

  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations",
    omniauth_callbacks: "users/omniauth_callbacks"
  }
  devise_scope :user do
    get "signin", to: "users/sessions#new"
    post "signin", to: "users/sessions#create"
    get "signup", to: "users/registrations#new"
    post "signup", to: "users/registrations#create"
  end
  resources :users, only: [:show, :index] do
    member do
      get :following, :followers
    end
  end
  resources :posts do
    resources :comments
  end
  resources :relationships, only: [:create, :destroy]
  resources :tags, only: :show
end
