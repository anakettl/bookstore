class Product < ApplicationRecord
  belongs_to :department

  validates_presence_of :name, :author, :description, :price, :amount, :department, message: "Can't be blank"
  validates :amount, numericality: { only_integer: true }

  scope :filter_by_department, -> (department_id) do
    where(department_id: department_id)
  end
end
