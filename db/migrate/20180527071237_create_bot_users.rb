class CreateBotUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :bot_users do |t|
      t.string :first_name

      t.timestamps
    end
  end
end
