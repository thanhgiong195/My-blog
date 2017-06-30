Rails.application.routes.draw do
  root to: "static_pages#home"
  get "static_pages/index"
  get "about", to: "static_pages#about"
  get "contact", to: "static_pages#contact"

  devise_for :users
  devise_scope :user do
    get "signin", to: "devise/sessions#new"
    post "signin", to: "devise/sessions#create"
    get "signup", to: "devise/registrations#new"
  end
end
