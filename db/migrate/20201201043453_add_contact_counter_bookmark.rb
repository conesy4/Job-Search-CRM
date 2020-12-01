class AddContactCounterBookmark < ActiveRecord::Migration[6.0]
  def change
    add_column :bookmarks, :contacts_count, :integer
  end
end
