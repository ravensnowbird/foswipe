class UpadateColumnNameToUsers < ActiveRecord::Migration
  def change
    rename_column :foswipe_comments , :user , :user_id
  end
end
