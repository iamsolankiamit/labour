class CreateAttendances < ActiveRecord::Migration
  def change
    create_table :attendances do |t|
      t.date :date
      t.integer :labour_id
      t.integer :work_id
      t.integer :hours
      t.time :in
      t.time :out

      t.timestamps
    end
  end
end
