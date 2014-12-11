class AddAccountToLabour < ActiveRecord::Migration
  def change
    add_column :labours, :account, :float, default: 0.0
  end
end
