class CreateFoswipeClients < ActiveRecord::Migration
  def change
    create_table :foswipe_clients do |t|
      t.string :name
      t.string :email
      
      t.timestamps
    end
  end
end
