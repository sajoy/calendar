require('sinatra')
require('sinatra/reloader')
require('sinatra/activerecord')
also_reload("lib/**/*.rb")
require('./lib/event')
require('pry')
require('pg')


get("/") do
  @events = Event.future_events().order(start_date: :asc)
  erb(:index)
end

post("/events") do
  description = params.fetch("description")
  location = params.fetch("location")
  date = params.fetch("date_year") + "-" + params.fetch("date_month") + "-" + params.fetch("date_day")
  start_time = date + " " + params.fetch("start_time_hour") + ":" + params.fetch("start_time_minute")
  end_time = date + " " +params.fetch("end_time_hour") + ":" + params.fetch("end_time_minute")
  event = Event.create({:description => description, :location => location, :start_date => start_time, :end_date => end_time})
  redirect('/')
end

get("/event/:id") do
  id = params.fetch("id").to_i()
  @event = Event.find(id)
  erb(:event)
end

patch('/event/edit/:id') do
  id = params.fetch("id").to_i()
  description = params.fetch("description")
  location = params.fetch("location")
  start_date = params.fetch("start_date")
  end_date = params.fetch("end_date")
  @event = Event.find(id)
  @event.update({:description => description, :location => location, :start_date => start_date, :end_date => end_date})
  redirect '/ '
end
