require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('the project path', {:type => :feature}) do
  it('has a field that will allow users to create a new project to add to the project list') do
    visit('/')
    fill_in('project-name', :with => 'Clean Up')
    click_button('Add Project')
    expect(page).to have_content('Success')
  end
end

describe('the project path', {:type => :feature}) do
  it('view the details of a project') do
    visit('/')
    fill_in('project-name', :with => 'Clean Up')
    click_button('Add Project')
    click_link('Home')
    click_link('Clean Up')
    expect(page).to have_content('Project Name:')
  end
end

describe('the edit a project path', {:type => :feature}) do
  it('updates the name of a project') do
    visit('/')
    fill_in('project-name', :with => 'Clean Up')
    click_button('Add Project')
    click_link('Home')
    click_link('Clean Up')
    click_link('Edit Project Details')
    fill_in('new-project-name', :with => 'Park Clean Up')
    click_button('Update')
    expect(page).to have_content('Park Clean Up')
  end
end

describe('the volunteer path', {:type => :feature}) do
  it('has a field that will allow users to create a new volunteer to add to the volunteer list') do
    visit('/')
    fill_in('project-name', :with => 'Clean Up')
    click_button('Add Project')
    click_link('Home')
    select('Clean Up', :from => 'project_id')
    fill_in('volunteer-first', :with => 'Steve')
    fill_in('volunteer-last', :with => 'Jobs')
    fill_in('hours', :with => '10')
    click_button('Add Volunteer')
    expect(page).to have_content('Success')
  end
end

describe('the edit a volunteer path', {:type => :feature}) do
  it('updates the hours of a volunteer') do
    visit('/')
    fill_in('project-name', :with => 'Clean Up')
    click_button('Add Project')
    click_link('Home')
    select('Clean Up', :from => 'project_id')
    fill_in('volunteer-first', :with => 'Steve')
    fill_in('volunteer-last', :with => 'Jobs')
    fill_in('hours', :with => '10')
    click_button('Add Volunteer')
    click_link('Home')
    click_link('Steve Jobs')
    click_link('Edit Volunteer Details')
    fill_in('new-hours', :with => '20')
    click_button('Update')
    expect(page).to have_content('Steve Jobs')
  end
end
