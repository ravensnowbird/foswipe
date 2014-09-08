class RemoveSupportNotesFromFoswipeUsers < ActiveRecord::Migration
  def change
    remove_column :foswipe_users, :suppoort_notes, :text
  end
end
