class ChangeUsersColumnsOrder < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :name, :string
    remove_column :users, :postcode, :string
    remove_column :users, :address, :text
    remove_column :users, :self_introduction, :text

    add_column :users, :user_name, :string, after: :email
    add_column :users, :postcode, :string, after: :user_name
    add_column :users, :address, :text, after: :postcode
    add_column :users, :self_introduction, :text, after: :address
  end
end
