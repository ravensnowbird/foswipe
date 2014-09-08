class CreateFoswipeComments < ActiveRecord::Migration
  def change
    create_table :foswipe_comments do |t|
      t.text :content
      t.string :user
      t.text :attachment

      t.timestamps
    end
  end
end
