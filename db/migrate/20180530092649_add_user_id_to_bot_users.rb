class AddUserIdToBotUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :bot_users, :user_id, :integer
  end
end
