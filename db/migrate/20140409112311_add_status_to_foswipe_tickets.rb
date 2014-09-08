class AddStatusToFoswipeTickets < ActiveRecord::Migration
  def change
    add_column :foswipe_tickets, :status, :string
  end
end
