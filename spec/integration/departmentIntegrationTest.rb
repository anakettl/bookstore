require 'rails_helper'
RSpec.feature "Department", :type => :feature do
  before(:each) do
    begin
      @department = FactoryBot.create(:department)
    rescue StandardError => e
      puts "#{e.message}"
    end
  end
  context '#create feature' do
    it 'with name valid' do
      begin
        visit "/departments/new"
      
        within find("#create-department-form") do
          fill_in "department[name]", :with => @department.name
          
          click_button "Add"

          expect(page.body).to include('Department was successfully created.')
        end
      rescue StandardError => e
        puts "#{e.message}"
      end
    end
  end
  context '#update feature' do
    it 'with name valid' do
      begin
        visit "/departments/new"
      
        within find("#create-department-form") do
          fill_in "department[name]", :with => "Departamento antigo"
          
          click_button "Add"
        end

        first(:link, 'Edit').click
      
        within find("#create-department-form") do
          fill_in "department[name]", :with => "Departamento novo"
          
          click_button "Add"
          expect(page.body).to include('Departamento novo')
          expect(page.body).to include('Department was successfully updated.')
        end
      rescue StandardError => e
        puts "#{e.message}"
      end
    end
  end
  context '#delete feature' do
    it 'with delete yes' do
      begin
        visit "/departments/new"
      
        within find("#create-department-form") do
          fill_in "department[name]", :with => "Mecânica"
          
          click_button "Add"
        end

        first(:link, 'Destroy').click

        page.driver.browser.switch_to.alert.accept

        expect(page.body).to include('Department was successfully destroyed.')
      rescue StandardError => e
        puts "#{e.message}"
      end
    end
  end
end