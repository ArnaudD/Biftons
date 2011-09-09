class CreateTransactions < ActiveRecord::Migration
  def change
    create_table :transactions do |t|
      t.string :name
      t.float :amount
      t.integer :user_id
      t.datetime :date

      t.timestamps
    end
  end
end
