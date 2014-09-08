class AddAttachmentUidToFoswipeTicketAttachments < ActiveRecord::Migration
  def change
    add_column :foswipe_ticket_attachments, :attachment_uid, :string
  end
end
