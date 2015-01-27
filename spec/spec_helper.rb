ENV['RACK_ENV'] = 'test'
require("rspec")
require("pg")
require("sinatra/activerecord")
require("event")

RSpec.configure do |config|
  config.after(:each) do
    Event.all().each() do |event|
      event.destroy()
    end
  end
end
