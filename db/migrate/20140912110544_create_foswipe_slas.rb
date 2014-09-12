class CreateFoswipeSlas < ActiveRecord::Migration
  def change
    create_table :foswipe_slas do |t|
      t.string :priority
      t.string :respondwith
      t.string :resolvewith
      t.string :operationalhours
      t.string :esclate
      t.integer :slas_id
      t.string :slas_type

      t.timestamps
    end
  end
end
