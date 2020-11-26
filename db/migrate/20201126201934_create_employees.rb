class CreateEmployees < ActiveRecord::Migration[6.0]
  def change
    create_table :employees do |t|
      t.integer :firm_id
      t.string :role
      t.string :first_name
      t.string :last_name
      t.string :notes
      t.boolean :alumni
      t.string :linkedin
      t.string :email
      t.integer :connections_count

      t.timestamps
    end
  end
end
