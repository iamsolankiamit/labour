class CreateWorks < ActiveRecord::Migration
  def change
    create_table :works do |t|
      t.date :start_date
      t.date :end_date
      t.integer :client_id

      t.timestamps
    end
  end
end
