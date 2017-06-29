Rails.application.routes.draw do
  root to: "static_pages#index"
  get "static_pages/home"

  devise_for :users
  devise_scope :user do
    get "signin", to: "devise/sessions#new"
    post "signin", to: "devise/sessions#create"
    get "signup", to: "devise/registrations#new"
  end
end
