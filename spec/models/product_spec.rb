require 'rails_helper'

RSpec.describe Product, :type => :model do
  before(:each) do
    @department = FactoryBot.create(:department)
    @product = FactoryBot.create(:product, department: @department)
	end

  it 'is valid with valid attributes' do
    expect(@product).to be_valid
  end
  it 'is not valid without name' do
    @product.name = nil
    expect(@product).to_not be_valid
  end
  it 'is not valid without author' do
    @product.author = nil
    expect(@product).to_not be_valid
  end
  it 'is not valid without description' do
    @product.description = nil
    expect(@product).to_not be_valid
  end
  it 'is not valid without price' do
    @product.price = nil
    expect(@product).to_not be_valid
  end
  it 'is not valid without amount' do
    @product.amount = nil
    expect(@product).to_not be_valid 
  end
end
