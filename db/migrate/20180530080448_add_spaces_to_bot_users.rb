class AddSpacesToBotUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :bot_users, :'last name', :string
    add_column :bot_users, :last_name, :string
    add_column :bot_users, :'messenger user id', :integer
    add_column :bot_users, :gender, :string
    add_column :bot_users, :timezone, :string
    add_column :bot_users, :source, :string
    add_column :bot_users, :locale, :string
    add_column :bot_users, :'chatfuel user id', :integer
    add_column :bot_users, :chatfuel_user_id, :integer
    add_column :bot_users, :'last user freeform input', :string
    add_column :bot_users, :last_user_freeform_input, :string
  end
end
