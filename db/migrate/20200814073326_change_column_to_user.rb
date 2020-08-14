class ChangeColumnToUser < ActiveRecord::Migration[5.0]

    def up
      change_column :users, :birthday, :date, null: false
    end

    def down
      change_column :users, :birthday, :string, null: false
    end
    
end
