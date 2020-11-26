class CreateCommunications < ActiveRecord::Migration[6.0]
  def change
    create_table :communications do |t|
      t.integer :contact_id
      t.integer :job_id
      t.date :date
      t.string :comm_type
      t.boolean :outgoing
      t.boolean :incoming
      t.string :notes
      t.date :followup_date
      t.integer :user_id

      t.timestamps
    end
  end
end
