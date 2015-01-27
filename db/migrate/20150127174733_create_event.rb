class CreateEvent < ActiveRecord::Migration
  def change
    create_table(:events) do |e|
      e.column(:description, :string)
      e.column(:location, :string)
      e.column(:start_date, :datetime)
      e.column(:end_date, :datetime)
    end
  end
end
