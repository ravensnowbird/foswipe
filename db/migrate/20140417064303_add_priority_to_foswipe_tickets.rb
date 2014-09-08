class AddPriorityToFoswipeTickets < ActiveRecord::Migration
  def change
    add_column :foswipe_tickets, :priority, :string
  end
end
