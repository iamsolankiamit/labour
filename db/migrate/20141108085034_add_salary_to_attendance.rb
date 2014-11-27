class AddSalaryToAttendance < ActiveRecord::Migration
  def change
    add_column :attendances, :salary, :integer
  end
end
