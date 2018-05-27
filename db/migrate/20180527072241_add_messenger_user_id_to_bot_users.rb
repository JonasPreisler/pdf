class AddMessengerUserIdToBotUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :bot_users, :messenger_user_id, :integer
  end
end
