class AddTicketIdToFoswipeComments < ActiveRecord::Migration
  def change
    add_column :foswipe_comments, :ticket_id, :integer
  end
end
