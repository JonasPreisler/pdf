class AddMessengerUserIdStringsToBotUsers < ActiveRecord::Migration[5.2]
  def change
		change_column :bot_users, :messenger_user_id, :string
		change_column :bot_users, :'messenger user id', :string
  end
end
