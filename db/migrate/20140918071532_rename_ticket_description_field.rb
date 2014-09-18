class RenameTicketDescriptionField < ActiveRecord::Migration
  def change
    rename_column :foswipe_tickets, :description, :content
  end
end
