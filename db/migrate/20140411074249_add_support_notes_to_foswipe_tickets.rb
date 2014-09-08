class AddSupportNotesToFoswipeTickets < ActiveRecord::Migration
  def change
    add_column :foswipe_tickets, :support_notes, :text
  end
end
