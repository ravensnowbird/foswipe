class AddTypeToComments < ActiveRecord::Migration
  def change
    add_column :foswipe_comments, :type, :string
  end
end
