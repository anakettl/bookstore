require 'rails_helper'

RSpec.describe "Products", type: :request do
  context 'GET #index' do
    # This is a request test. a GET to type request is made to index in the url '/products'. 
    # The expected response is that the response status is 200
    before do
      get '/products'
    end
    
    it 'return http status 200' do
      expect(response).to have_http_status(200)
    end
  end

  context 'POST #create with params' do
    # This is a request test. a POST type request is made to create the url '/products'. 
    # with params: 
          # 'name': 'Quincas Borba', 
          # 'author': 'Machado de Assis',
          # 'description': 'Quincas Borba é um romance escrito por Machado de Assis, desenvolvido em princípio como folhetim na revista A Estação, entre os anos de 1886 e 1891',
          # 'price': 22.90,
          # 'amount': 7,
          # 'department_id': @department.id
    # Then the method performs a GET request for /products
    # The expected response is for the request body to include the product[name] parameter sent
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
      expect(response.body).to include(@product.author)
      expect(response.body).to include(@product.description)
    end
  end

end