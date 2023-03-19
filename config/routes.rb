Rails.application.routes.draw do
  get 'customers/my_page' => 'customers#show', as: :my_page
  get 'customers/my_page/edit' => 'customers#edit', as: :my_page_edit
  patch 'customers/update'
  get 'customers/unsubscribe'
  patch 'customers/withdraw'
  get 'homes/index'
  root to: "books#search"
  devise_for :customers
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
