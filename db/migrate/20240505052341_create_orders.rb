class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :post_code,  null: false
      t.integer :shipping_area_id, null: false
      t.string :city, null: false
      t.string :block, null: false
      t.string :building
      t.string :phone_number, null: false
      t.references :purchase, null: false, foreign_key: true
      t.timestamps
    end
  end
end
