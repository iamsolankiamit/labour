class AddAccountSetteledOnToLabours < ActiveRecord::Migration
  def change
    add_column :labours, :account_setteled_on, :date
  end
end
