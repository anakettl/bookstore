require 'rails_helper'

RSpec.describe Product, :type => :model do
  subject { 
    described_class.new(
      name: 'O mito de Sísifo',
      author: 'Albert Camus',
      description: 'De um dos mais importantes e representativos autores do século XX e Prêmio Nobel de Literatura.Albert Camus, um dos escritores e intelectuais mais influentes do século XX, publicou O mito de Sísifo em 1942. Este ensaio sobre o absurdo tornou-se uma importante contribuição filosófico-existencial e exerceu profunda influência sobre toda uma geração.',
      price: 32.44,
      amount: 5) 
  } 

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end
  it 'is not valid without name' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid without author' do
    subject.author = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid without description' do
    subject.description = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid without price' do
    subject.price = nil
    expect(subject).to_not be_valid
  end
  it 'is not valid without amount' do
    subject.amount = nil
    expect(subject).to_not be_valid 
  end

end