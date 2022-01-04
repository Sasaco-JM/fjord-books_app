class ChangeUsersColumns < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :user_name, :string
    remove_column :users, :postcode, :string
    remove_column :users, :address, :text
    remove_column :users, :self_introduction, :text

    add_column :users, :user_name, :string
    add_column :users, :postcode, :string
    add_column :users, :address, :text
    add_column :users, :self_introduction, :text
  end
end
