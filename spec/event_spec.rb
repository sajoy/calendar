require('spec_helper')

describe(Event) do
  it("validates presence of all input fields") do
    event = Event.new({:description => "", :location => "downstairs", :start_date => "2010-05-10", :end_date => "2011-10-05"})
    expect(event.save()).to(eq(false))
  end

  it("only populates events which haven't happened") do
    event1 = Event.create({:description => "Wash car", :location => "downstairs", :start_date => "2010-05-10", :end_date => "2011-10-05"})
    event2 = Event.create({:description => "Wash car", :location => "downstairs", :start_date => "2010-05-10", :end_date => "2011-10-05"})
    event3 = Event.create({:description => "Wash car", :location => "downstairs", :start_date => "2078-05-10", :end_date => "2078-10-05"})
    event4 = Event.create({:description => "Wash car", :location => "downstairs", :start_date => "2018-05-10", :end_date => "2018-10-05"})
    expect(Event.future_events()).to(eq([event3, event4]))
  end

  it("will return the events for the next 7 days") do
    event1 = Event.create({:description => "Wash car", :location => "downstairs", :start_date => "2015-01-26", :end_date => "2015-02-05"})
    event1 = Event.create({:description => "Wash car", :location => "downstairs", :start_date => "2015-01-27", :end_date => "2015-02-05"})
    event2 = Event.create({:description => "Wash car", :location => "downstairs", :start_date => "2015-01-30", :end_date => "2015-02-05"})
    event3 = Event.create({:description => "Wash car", :location => "downstairs", :start_date => "2078-05-10", :end_date => "2078-10-05"})
    event4 = Event.create({:description => "Wash car", :location => "downstairs", :start_date => "2018-05-10", :end_date => "2018-10-05"})
    expect(Event.week_events()).to(eq([event1, event2]))
  end

end
