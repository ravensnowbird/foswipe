class AddColumeToFoswipeTickets < ActiveRecord::Migration
  def change
    add_reference :foswipe_tickets, :user_group, index: true
  end
end
