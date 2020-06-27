Rails.application.routes.draw do
  get "products/new", to: "products#new"
  post "products/new", to: "products#create"
  root to: "products#index"
end
