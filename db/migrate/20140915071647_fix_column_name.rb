class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :foswipe_ticket_attachments, :foswipe_ticket_id, :ticket_id
  end
end
