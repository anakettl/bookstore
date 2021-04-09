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
    # This is a test of the create department feature. 
    # He visits the "/departments/new" url, searches for the form with id #create-department-form, 
    # fills the department[name] field with a valid name and clicks the add button. 
    # The expected response is for the body of the page to include the message 'The department was created successfully'
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
    # This is a test of the update department feature. 
    # He visits the "/departments/new" url, searches for the form with id #create-department-form, 
    # fills the department[name] field with a valid name and clicks the add button. 
    # The test looks for and clicks on the first edit link, looks for the form with id # create-department-form 
    # and fills the department[name] field with the value "Novo departamento" and clicks add.
    # The test expects the body of the page to include "new department" and the message: 'Department was successfully updated.'
   
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
    # This is a test of the delete department feature. 
    # He visits the "/departments/new" url, searches for the form with id #create-department-form, 
    # fills the department[name] field with a 'Mecânica' and clicks the add button. 
    # The test looks for and clicks on the first destroy link
    # when the page alert is generated, the driver changes the focus to the alert and clicks accept. 
    # The expected result of the test is that the page includes the message 'Department was successfully destroyed.'
    
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