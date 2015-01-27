class Event < ActiveRecord::Base

  scope(:future_events, -> do
    where("start_date > ?", Time.now() )
  end)

  validates(:description, :presence => true)
  validates(:location, :presence => true)
  validates(:start_date, :presence => true)
  validates(:end_date, :presence => true)

end
