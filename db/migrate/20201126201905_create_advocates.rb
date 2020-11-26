class CreateAdvocates < ActiveRecord::Migration[6.0]
  def change
    create_table :advocates do |t|
      t.integer :contact_id
      t.integer :job_id

      t.timestamps
    end
  end
end
