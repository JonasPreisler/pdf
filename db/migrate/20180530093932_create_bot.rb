class CreateBot < ActiveRecord::Migration[5.2]
  def change
    create_table :bots do |t|
      t.string :name
      t.string :first_name
      t.string :'first name'
      t.integer :user_id
    end
  end
end
