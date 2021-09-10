class AddUserIdToFriendsTable < ActiveRecord::Migration[6.1]
  def change
    add_column :friends_tables, :user_id, :interger
    add_index :friends_tables, :user_id
  end
end
