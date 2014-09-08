class AddAuthorToFoswipeTickets < ActiveRecord::Migration
  def change
    add_column :foswipe_tickets, :author, :string
  end
end
