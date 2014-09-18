class RenameColumnFoswipeCommentIdToFoswipeCommentAttachments < ActiveRecord::Migration
  def change
    rename_column :foswipe_comment_attachments, :foswipe_comment_id, :comment_id
  end
end
