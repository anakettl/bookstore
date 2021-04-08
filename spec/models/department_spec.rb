require 'rails_helper'

RSpec.describe Department, :type => :model do
  context 'validation' do
    before(:each) do
      @department = FactoryBot.create(:department)
    end

    it 'is valid with valid atribbutes' do
      expect(@department).to be_valid
    end
    it 'is not valid without name' do
      @department.name = nil
      expect(@department).to_not be_valid
    end
    it 'is the same name' do
      @department.name = "Arte"
      expect(@department.name).to eql("Arte")
    end
  end
end
