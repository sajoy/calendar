class Event < ActiveRecord::Base
  #default_scope { order(:start_date >= Time.new()) }


  validates(:description, :presence => true)
  validates(:location, :presence => true)
  validates(:start_date, :presence => true)
  validates(:end_date, :presence => true)

end
