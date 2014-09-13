class AddOrganigationToUser < ActiveRecord::Migration
  def change
    add_reference :foswipe_users, :organization, index: true
  end
end
