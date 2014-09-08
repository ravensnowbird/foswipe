class AddSupportNotesToFoswipeUsers < ActiveRecord::Migration
  def change
    add_column :foswipe_users, :suppoort_notes, :text
  end
end