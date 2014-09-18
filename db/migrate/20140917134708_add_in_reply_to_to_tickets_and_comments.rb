class AddInReplyToToTicketsAndComments < ActiveRecord::Migration
  def change
    add_column :foswipe_comments, :message_id, :string
    add_column :foswipe_tickets, :message_id, :string
    add_index :foswipe_comments, :message_id
    add_index :foswipe_tickets, :message_id
  end
end
