class CreateFoswipeProjects < ActiveRecord::Migration
  def change
    create_table :foswipe_projects do |t|
      t.string :name
      t.text :description
      t.integer :duration

      t.timestamps
    end
  end
end
