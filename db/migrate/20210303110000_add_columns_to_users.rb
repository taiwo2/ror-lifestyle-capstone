class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :twitter, :string
    add_column :users, :facebook, :string
    add_column :users, :linkedin, :string
    add_column :users, :profile_image, :string
    add_column :users, :admin, :boolean, default: false
  end
end
