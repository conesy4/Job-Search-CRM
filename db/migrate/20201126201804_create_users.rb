class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.integer :bookmarks_count
      t.integer :contacts_count
      t.integer :communications_count
      t.integer :jobs_count

      t.timestamps
    end
  end
end
