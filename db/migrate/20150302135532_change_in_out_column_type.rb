class ChangeInOutColumnType < ActiveRecord::Migration
  def change
    change_column :attendances, :in , :string
    change_column :attendances , :out , :string
  end
end
