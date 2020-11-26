class CreateBookmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :bookmarks do |t|
      t.integer :firm_id
      t.integer :user_id
      t.string :notes

      t.timestamps
    end
  end
end
