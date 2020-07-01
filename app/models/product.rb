class Product < ApplicationRecord
  validates_presence_of :name, :author, :description, :price, :amount, message: "Can't be blank"
  validates :amount, numericality: { only_integer: true }
end
