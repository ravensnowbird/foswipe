class AddNameToFoswipeUsers < ActiveRecord::Migration
  def change
    add_column :foswipe_users, :name, :string
  end
end
