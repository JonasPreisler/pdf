class AddBotIdToBotUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :bot_users, :bot_id, :integer
  end
end
