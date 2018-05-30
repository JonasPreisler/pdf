class CreatePage < ActiveRecord::Migration[5.2]
  def change
    create_table :pages do |t|
      t.integer :bot_user_id
    end
  end
end
