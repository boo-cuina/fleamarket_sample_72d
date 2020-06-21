class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.string     :name,              null: false
      t.text       :description,       null: false
      t.string     :size,              null: false
      t.string     :status,            null: false
      t.integer    :price,             null: false
      t.string     :shipping_fee,      null: false
      t.references :shippingfrom,      null: false
      t.string     :shipping_days,     null: false
      t.references :buyer,                           foreign_key: { to_table: :users }
      t.references :seller,            null: false,  foreign_key: { to_table: :users }
      t.references :category,          null: false,  foreign_key: true
      t.timestamps
    end
  end
end
