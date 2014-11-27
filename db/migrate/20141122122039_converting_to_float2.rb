class ConvertingToFloat2 < ActiveRecord::Migration
  def change
      change_column :labours, :salary_per_day, :float
    change_column :labours, :salary_for_hours, :float

  end
end
