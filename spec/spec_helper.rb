require('rspec')
require('pry')
require('client')
require('stylist')
require('pg')
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

RSpec.configure do |config|
  config.color = true
  config.after(:each) do
    DB.exec('DELETE FROM clients *;')
    DB.exec('DELETE FROM stylists *;')
  end
end
