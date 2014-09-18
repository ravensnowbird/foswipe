class RemoveAttachmentToFoswipeComments < ActiveRecord::Migration
  def change
    remove_column :foswipe_comments, :attachment, :string
  end
end
