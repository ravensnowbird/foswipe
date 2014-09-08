class CreateFoswipeProducts < ActiveRecord::Migration
  def change
    create_table :foswipe_products do |t|
      t.string :name

      t.timestamps
    end
  end
end
