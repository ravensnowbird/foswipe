class CreateFoswipeTickets < ActiveRecord::Migration
  def change
    create_table :foswipe_tickets do |t|
      t.text :description
      t.references :client, index: true
      t.references :support, index: true
      
      t.timestamps
    end
  end
end
