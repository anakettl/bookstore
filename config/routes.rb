Rails.application.routes.draw do
  delete "products/:id", to: "products#destroy", as: :product
  get "products/new", to: "products#new"
  post "products/new", to: "products#create"
  root to: "products#index"
end
