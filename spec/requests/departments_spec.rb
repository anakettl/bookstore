require 'rails_helper'

RSpec.describe "Departments", type: :request do
  context 'GET #index' do
    # This is a request test. a GET to type request is made to index in the url '/departments'. 
    # The expected response is that the response status is 200
    before do
      get '/departments'
    end
    
    it 'return http status 200' do
      expect(response).to have_http_status(200)
    end
  end

  context 'GET #show' do
    # This is a request test. a GET type request is made to show the url '/departments'. 
    # The expected response is that the response body include the department name
    # The expected response is that the response status is 200
    before(:each) do
      @department = FactoryBot.create(:department)
      get '/departments', params: { department: { 'name': @department.name, 'id': @department.id } }
    end

    it 'returns http success' do
      expect(response).to have_http_status(200)
    end

    it 'return department name in request body' do
      expect(response.body).to include(@department.name)
    end
  end

  context 'POST #create' do
    # This is a request test. a POST type request is made to create the url '/departments'. 
    # with params name: 'Roupas'
    # Then the method performs a GET request for / departments
    # The expected response is for the request body to include the department [name] parameter sent
    before do
      post '/departments', params: { department: { 'name': 'Roupas' } }
      get '/departments'
    end

    it 'returns http success' do
      expect(response).to have_http_status(200)
    end

    it 'create a new department' do
      expect(response.body).to include('Roupas')
    end
  end

  context 'POST #update' do
    # This is a request test. 
    # the department_params variable receives the department[name] parameter
    # the department variable receives the department created with the parameters of department_params
    # A request of type put is sent with the ID of the created department passing through a parameter in the department [name] 'Tecnologia'.
    # Then a GET type request is made to the url '/departments'.
    # The expected response is for the request body to include 'Tecnologia'
    before do
      department_params = { department: { name: 'Telefonia' } }
      
      department = Department.create(department_params[:department])

      put "/departments/#{department.id}", params: { department: { name: 'Tecnologia' } }

      get '/departments'
    end

    it 'returns http success' do
      expect(response).to have_http_status(200)
    end

    it 'should update the name' do
      expect(response.body).to include('Tecnologia')
    end
  end
end
