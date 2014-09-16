class CreateFoswipeUserGroups < ActiveRecord::Migration
  def change
    create_table :foswipe_user_groups do |t|
      t.string :group_name

      t.timestamps
    end
  end
end
