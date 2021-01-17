class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :product_name
      t.text :text
      t.integer :price
      t.integer :fee_id
      t.integer :state_id
      t.integer :category_id
      t.integer :prefecture_id
      t.integer :scheduled_delivery_id
      t.integer :user_id,foreign_key: true
      t.timestamps
    end
  end
end
