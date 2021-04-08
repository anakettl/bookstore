require 'rails_helper'

RSpec.describe "Products", type: :request do
  context 'GET #index' do
    before do
      get '/products'
    end
    
    it 'return http status 200' do
      expect(response).to have_http_status(200)
    end
  end

  context 'POST #create with params' do
    before do
      @department = FactoryBot.create(:department)
      post '/products', params: 
      { 
        product: 
        { 'name': 'Quincas Borba', 
          'author': 'Machado de Assis',
          'description': 'Quincas Borba é um romance escrito por Machado de Assis, desenvolvido em princípio como folhetim na revista A Estação, entre os anos de 1886 e 1891',
          'price': 22.90,
          'amount': 7,
          'department_id': @department.id
        } 
      }

      get '/products'
    end

    it 'create a new product' do
      expect(response.body).to include('Quincas Borba')
    end
  end

  context 'POST #create with factory' do
    before do
      @product = FactoryBot.create(:product)
      post '/products', params: 
      { 
        product: 
        { 'name': @product.name, 
          'author': @product.author,
          'description': @product.description,
          'price': @product.price,
          'amount': @product.amount,
          'department_id': @product.department_id
        } 
      }

      get '/products'
    end

    it 'create a new product' do
      expect(response.body).to include(@product.name)
    end
  end

end