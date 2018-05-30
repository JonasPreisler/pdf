class ChangeMessengerUserIdInteger < ActiveRecord::Migration[5.2]
  def change
		change_column :bot_users, :messenger_user_id, :integer, limit: 8
		change_column :bot_users, :'messenger user id', :integer, limit: 8
  end
end
