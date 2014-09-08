class AddTypeToFoswipeUsers < ActiveRecord::Migration
  def change
    add_column :foswipe_users, :type, :string
  end
end
