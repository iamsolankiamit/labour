class AddClientSalaryToLabour < ActiveRecord::Migration
  def change
    add_column :labours, :client_salary, :integer
  end
end
