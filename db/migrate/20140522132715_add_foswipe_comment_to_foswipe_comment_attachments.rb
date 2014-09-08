class AddFoswipeCommentToFoswipeCommentAttachments < ActiveRecord::Migration
  def change
    add_column :foswipe_comment_attachments, :foswipe_comment_id, :integer, :index => true
  end
end
