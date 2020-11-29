class SecondCreatorUpdate < ActiveRecord::Migration[6.0]
  def change
    add_column :firms, :creator, :string
    add_column :employees, :creator, :string
  end
end
