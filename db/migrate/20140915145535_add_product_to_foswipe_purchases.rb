class AddProductToFoswipePurchases < ActiveRecord::Migration
  def change
    add_reference :foswipe_purchases, :product, index: true
  end
end
