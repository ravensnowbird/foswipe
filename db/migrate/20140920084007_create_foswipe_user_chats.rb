class CreateFoswipeUserChats < ActiveRecord::Migration
  def change
    create_table :foswipe_user_chats do |t|
      t.integer :customer_id
      t.integer :agent_id
      t.text :content

      t.timestamps
    end
  end
end
