class LinkFields < ActiveRecord::Migration[6.0]
  def change
    add_column :firms, :website, :string
    add_column :jobs, :website, :string
  end
end
