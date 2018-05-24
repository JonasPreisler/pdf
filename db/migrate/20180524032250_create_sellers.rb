class CreateSellers < ActiveRecord::Migration[5.2]
  def change
    create_table :sellers do |t|
      t.string :name
	  t.string :country
	  t.string :website
	  t.string :email
	  t.string :logo
    end
  end
end
