class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.integer :user_id
      t.integer :employee_id
      t.string :notes
      t.string :relationship
      t.string :outgoing_comms
      t.string :incoming_comms
      t.date :last_outgoing_comm
      t.date :last_incoming_comm
      t.date :followup_date
      t.integer :communications_count
      t.integer :advocates_count

      t.timestamps
    end
  end
end
