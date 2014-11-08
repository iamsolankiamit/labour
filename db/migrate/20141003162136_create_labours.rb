class CreateLabours < ActiveRecord::Migration
  def change
    create_table :labours do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone_no
      t.date :date_of_joining
      t.integer :salary_per_day
      t.integer :salary_for_hours
      t.boolean :on_vacation
      t.boolean :has_left

      t.timestamps
    end
  end
end
