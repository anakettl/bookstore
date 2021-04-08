require 'rails_helper'

RSpec.describe Department, :type => :model do
  context 'validation' do
    before(:each) do
      @department = FactoryBot.create(:department)
    end
    # This is a unit test. 
    # This test create a department with valid attributes and verify if is valid
    it 'is valid with valid atribbutes' do
      expect(@department).to be_valid
    end
    # This is a unit test. 
    # This test create a department with invalid attributes and verify if is invalid
    it 'is not valid without name' do
      @department.name = nil
      expect(@department).to_not be_valid
    end
  end
end
