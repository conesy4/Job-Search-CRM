class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.integer :firm_id
      t.string :role
      t.string :location
      t.string :notes
      t.date :application_deadline
      t.boolean :applied
      t.date :application_date
      t.string :application_status
      t.string :application_mode
      t.string :application_outcome
      t.string :application_next_steps
      t.integer :user_id
      t.integer :communications_count
      t.integer :advocates_count

      t.timestamps
    end
  end
end
