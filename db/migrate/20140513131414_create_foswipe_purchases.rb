class CreateFoswipePurchases < ActiveRecord::Migration
  def change
    create_table :foswipe_purchases do |t|
      t.string :name

      t.timestamps
    end
  end
end
