Rails.application.routes.draw do
  resources :customers, only: [:update]
  get 'customers/my_page' => 'customers#show', as: :my_page
  get 'customers/my_page/edit' => 'customers#edit', as: :my_page_edit
  get 'customers/unsubscribe'
  patch 'customers/withdraw'
  get 'homes/index'
  root to: "books#search"
  resources :books, only: [:show]
  devise_for :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
