class AddOnVacationToClient < ActiveRecord::Migration
  def change
    add_column :clients, :on_vacation, :boolean, default: false
  end
end
