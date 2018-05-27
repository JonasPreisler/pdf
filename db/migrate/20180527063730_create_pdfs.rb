class CreatePdfs < ActiveRecord::Migration[5.2]
  def change
    create_table :pdfs do |t|
      t.integer :amount_of_users
      t.string :business_name
      t.datetime :date
      t.string :agency_name

      t.timestamps
    end
  end
end
