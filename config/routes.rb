Rails.application.routes.draw do
  resources :departments
  get "products/search", to: "products#search", as: :search_product
  resources :products
  root to: "products#index"
end
