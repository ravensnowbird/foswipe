class CreateFoswipeUserGroupsUser < ActiveRecord::Migration
  def change
    create_table :foswipe_user_groups_users do |t|
      t.references :user, index: true
      t.references :user_group, index: true
    end
  end
end
