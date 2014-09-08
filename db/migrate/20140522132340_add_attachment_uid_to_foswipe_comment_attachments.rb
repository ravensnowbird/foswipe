class AddAttachmentUidToFoswipeCommentAttachments < ActiveRecord::Migration
  def change
    add_column :foswipe_comment_attachments, :attachment_uid, :string
  end
end
