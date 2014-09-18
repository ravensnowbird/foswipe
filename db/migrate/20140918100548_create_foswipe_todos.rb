class CreateFoswipeTodos < ActiveRecord::Migration
  def change
    create_table :foswipe_todos do |t|
      t.text :content
      t.references :ticket, index: true

      t.timestamps
    end
  end
end
