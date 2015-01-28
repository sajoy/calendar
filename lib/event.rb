class Event < ActiveRecord::Base

  scope(:future_events, -> do
    where("start_date > ?", Time.now())
  end)

  scope(:week_events, -> do
    where("start_date >= :now AND start_date <= :week",
    {now: Time.now - 1.day, week: Time.now + 7.day})
    # where("start_date > ?", Time.now() && "start_date < ?", Time.now() + 7.day())
  end)

  validates(:description, :presence => true)
  validates(:location, :presence => true)
  validates(:start_date, :presence => true)
  validates(:end_date, :presence => true)

end
