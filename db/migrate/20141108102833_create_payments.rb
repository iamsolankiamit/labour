class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.integer :labour_id
      t.integer :amount_paid
      t.date :date

      t.timestamps
    end
  end
end
