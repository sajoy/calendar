require('spec_helper')

describe(Event) do
  it("validates presence of all input fields") do
    event = Event.new({:description => "", :location => "downstairs", :start_date => "2010-05-10", :end_date => "2011-10-05"})
    expect(event.save()).to(eq(false))
  end
end
