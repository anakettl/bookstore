class Product < ApplicationRecord
  validates_presence_of :name, :author, :description, :price, :amount, on: :create, message: "Can't be blank"
end
