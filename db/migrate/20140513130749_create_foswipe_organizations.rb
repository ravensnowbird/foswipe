class CreateFoswipeOrganizations < ActiveRecord::Migration
  def change
    create_table :foswipe_organizations do |t|
      t.string :name

      t.timestamps
    end
  end
end
