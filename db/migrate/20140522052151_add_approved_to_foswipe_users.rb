class AddApprovedToFoswipeUsers < ActiveRecord::Migration
  def change
    add_column :foswipe_users, :approved, :boolean
  end
end
