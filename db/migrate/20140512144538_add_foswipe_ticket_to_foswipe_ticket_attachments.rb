class AddFoswipeTicketToFoswipeTicketAttachments < ActiveRecord::Migration
  def change
    add_reference :foswipe_ticket_attachments, :foswipe_ticket, index: true
  end
end
