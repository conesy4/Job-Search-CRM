class CreateFirms < ActiveRecord::Migration[6.0]
  def change
    create_table :firms do |t|
      t.string :industry
      t.string :location
      t.string :name
      t.string :notes
      t.integer :jobs_count
      t.integer :bookmarks_count
      t.integer :employees_count

      t.timestamps
    end
  end
end
