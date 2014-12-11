class AddWorkIdToLabour < ActiveRecord::Migration
  def change
    add_column :labours, :work_id, :integer
  end
end
