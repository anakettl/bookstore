Rails.application.routes.draw do
  resources :departments
  get "products/search", to: "products#search", as: :search_product
  resources :products, only: [:new, :create, :destroy, :edit, :update]
  root to: "products#index"
end
