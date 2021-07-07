class Department < ApplicationRecord
  validates_presence_of :name, uniqueness: true, message: "can't be blank"
end
