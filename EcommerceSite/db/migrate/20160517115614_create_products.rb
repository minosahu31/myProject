class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.decimal :nameprice
      t.integer :quantity

      t.timestamps null: false
    end
  end
end
