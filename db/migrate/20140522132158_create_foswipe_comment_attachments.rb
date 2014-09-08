class CreateFoswipeCommentAttachments < ActiveRecord::Migration
  def change
    create_table :foswipe_comment_attachments do |t|

      t.timestamps
    end
  end
end
