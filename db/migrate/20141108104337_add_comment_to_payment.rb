class AddCommentToPayment < ActiveRecord::Migration
  def change
    add_column :payments, :comment, :string
  end
end
