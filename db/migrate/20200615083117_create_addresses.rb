class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string      :last_name,            null: false
      t.string      :last_name_reading,    null: false
      t.string      :first_name,           null: false
      t.string      :first_name_reading,   null: false
      t.integer     :postcode,             null: false
      t.references  :prefecture,           null: false
      t.string      :city,                 null: false
      t.string      :block,                null: false
      t.string      :building
      t.string      :phone_number,         null: false
      t.references  :user,                 null: false, foreign_key: true
      t.timestamps
    end
  end
end
