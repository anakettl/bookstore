Rails.application.routes.draw do
  get 'homepage/index'
  resources :departments
  get "products/search", to: "products#search", as: :search_product
  resources :products
  root to: "homepage#index"
end
