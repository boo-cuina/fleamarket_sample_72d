class ChangeColumnToAddress < ActiveRecord::Migration[5.0]

  def up
    change_column :addresses, :postcode, :string, null: false
  end

  def down
    change_colum :addresses, :postcode, :integer, null: false
  end
end
