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
      get '/departments', params: { 'name': @department.name, 'id': @department.id }
    end

    it 'returns http success' do
      expect(response).to have_http_status(200)
    end

    it 'return department name in request body' do
      expect(response.body).to include(@department.name)
    end
  end
end
