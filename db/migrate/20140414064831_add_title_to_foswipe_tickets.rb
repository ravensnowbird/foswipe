class AddTitleToFoswipeTickets < ActiveRecord::Migration
  def change
    add_column :foswipe_tickets, :title, :string
  end
end
