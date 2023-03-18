Rails.application.routes.draw do
  get 'customers/show'
  get 'customers/update'
  get 'customers/unsubscribe'
  get 'customers/withdraw'
  get 'homes/index'
  root to: "books#search"
  devise_for :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
