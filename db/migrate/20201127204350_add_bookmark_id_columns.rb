class AddBookmarkIdColumns < ActiveRecord::Migration[6.0]
  def change
    add_column :contacts, :bookmark_id, :integer
    add_column :jobs, :bookmark_id, :integer
  end
end
