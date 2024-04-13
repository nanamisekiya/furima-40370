class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string :product_name, null: false
      t.text :product_description, null: false
      t.integer :product_category_id, null: false
      t.integer :product_status_id, null: false
      t.integer :shipping_fee_id, null: false
      t.integer :shipping_area_id, null: false
      t.integer :delivery_time_id, null: false
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end
