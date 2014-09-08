class RemoveTicketUidFromFoswipeTicketAttachments < ActiveRecord::Migration
  def change
    remove_column :foswipe_ticket_attachments, :ticket, :text
  end
end
