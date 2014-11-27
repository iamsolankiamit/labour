class ConvertingToFloat < ActiveRecord::Migration
  def change
    change_column :payments, :amount_paid, :float
    change_column :attendances, :salary, :float
  end
end
