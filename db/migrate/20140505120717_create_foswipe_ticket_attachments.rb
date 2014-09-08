class CreateFoswipeTicketAttachments < ActiveRecord::Migration
  def change
    create_table :foswipe_ticket_attachments do |t|

      t.timestamps
    end
  end
end
