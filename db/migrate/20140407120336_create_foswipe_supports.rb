class CreateFoswipeSupports < ActiveRecord::Migration
  def change
    create_table :foswipe_supports do |t|
      t.string :name
      t.string :email

      t.timestamps
    end
  end
end
