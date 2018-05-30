class ChangeChatfuelUserIdInBotUsers < ActiveRecord::Migration[5.2]
  def change
		change_column :bot_users, :chatfuel_user_id, :string
		change_column :bot_users, :'chatfuel user id', :string
  end
end
