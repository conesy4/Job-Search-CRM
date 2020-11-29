class AddCreatedByEmployeeFirm < ActiveRecord::Migration[6.0]
  def change
    add_column :firms, :created_by, :string
    add_column :employees, :created_by, :string
  end
end
