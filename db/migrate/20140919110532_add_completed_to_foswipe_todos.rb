class AddCompletedToFoswipeTodos < ActiveRecord::Migration
  def change
    add_column :foswipe_todos, :completed, :boolean
  end
end
