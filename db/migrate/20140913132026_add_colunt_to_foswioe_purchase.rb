class AddColuntToFoswioePurchase < ActiveRecord::Migration
  def change
    add_reference :foswipe_purchases, :organization, index: true
  end
end
