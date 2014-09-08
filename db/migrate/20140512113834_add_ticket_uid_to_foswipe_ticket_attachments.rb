class AddTicketUidToFoswipeTicketAttachments < ActiveRecord::Migration
  def change
    add_column :foswipe_ticket_attachments, :ticket, :text
  end
end
