class CreateFoswipeAdmins < ActiveRecord::Migration
  def change
    create_table :foswipe_admins do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
