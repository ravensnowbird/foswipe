class CreateFoswipeAttachments < ActiveRecord::Migration
  def change
    create_table :foswipe_attachments do |t|
      t.string :attachment_uid
      t.string :attachable_type
      t.integer :attachable_id

      t.timestamps
    end
  end
end
