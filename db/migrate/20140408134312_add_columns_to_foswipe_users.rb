class AddColumnsToFoswipeUsers < ActiveRecord::Migration
  def change
    add_column :foswipe_users, :first_name, :string
    add_column :foswipe_users, :last_name, :string
    add_column :foswipe_users, :address, :string
    add_column :foswipe_users, :mobile_no, :string
    add_column :foswipe_users, :gender, :string
    add_column :foswipe_users, :agent, :boolean
    add_column :foswipe_users, :admin, :boolean
    add_column :foswipe_users, :confirmation_token, :string, :index => true, :unique => true
    add_column :foswipe_users, :confirmed_at, :datetime
    add_column :foswipe_users, :confirmation_sent_at, :datetime
    add_column :foswipe_users, :unconfirmed_email, :string
  end
  
end