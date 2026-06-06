class AddAddressToUsers < ActiveRecord::Migration[8.1]
  def up
    add_column :users, :address, :string

    execute "UPDATE users SET address = '' WHERE address IS NULL;"

    change_column_null :users, :address, false
  end

  def down
    remove_column :users, :address
  end
end
