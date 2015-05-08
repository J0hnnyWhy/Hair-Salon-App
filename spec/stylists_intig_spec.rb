require('capybara/rspec')
require('./app')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

DB = PG.connect({:dbname => 'hair_salon_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM clients *;")
    DB.exec("DELETE FROM stylists *;")
  end
end

describe('adding a new stylist', {:type => :feature}) do
  it('allows a user to click a stylist to see the clients') do
    visit('/')
    click_link('Add New Stylist')
    fill_in('stylist', :with =>'Sally')
    click_button('Add Stylist')
    expect(page).to have_content('Success!')
  end
end