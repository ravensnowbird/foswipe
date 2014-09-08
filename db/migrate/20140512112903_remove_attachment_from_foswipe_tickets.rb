class RemoveAttachmentFromFoswipeTickets < ActiveRecord::Migration
  def change
    remove_column :foswipe_tickets, :attachment, :text
  end
end
