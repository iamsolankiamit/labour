class AddClientSalaryToAttendance < ActiveRecord::Migration
  def change
    add_column :attendances, :client_salary, :float
  end
end
