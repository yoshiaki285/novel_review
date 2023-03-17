Rails.application.routes.draw do
  get 'homes/index'
  root to: "books#search"
  devise_for :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
