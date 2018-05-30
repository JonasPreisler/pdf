class AddTestTestToBotUsersAgain < ActiveRecord::Migration[5.2]
  def change
    add_column :bot_users, :test_test, :string
  end
end
