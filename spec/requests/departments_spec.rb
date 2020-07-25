require 'rails_helper'

RSpec.describe "Departments", type: :request do
  context 'GET #index' do
    before do
      get '/departments'
    end
    
    it 'return http status 200' do
      expect(response).to have_http_status(200)
    end
  end

  context 'GET #show' do
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
    before do
      post '/departments', params: { department: { 'name': 'Roupas' } }
      get '/departments'
    end

    it 'create a new department' do
      expect(response.body).to include('Roupas')
    end
  end

  context 'POST #update' do
    before do
      department_params = { department: { name: 'Telefonia' } }
      
      department = Department.create(department_params[:department])

      put "/departments/#{department.id}", params: { department: { name: 'Tecnologia' } }

      get '/departments'
    end

    it 'should update the name' do
      expect(response.body).to include('Tecnologia')
    end
  end
end
