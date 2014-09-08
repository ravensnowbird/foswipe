class AddAttachmentToFoswipeTickets < ActiveRecord::Migration
  def change
    add_column :foswipe_tickets, :attachment, :text
  end
end
