class AddTestTestToBotUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :bot_users, :'test test', :string
  end
end
