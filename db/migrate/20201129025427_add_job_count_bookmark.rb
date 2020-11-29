class AddJobCountBookmark < ActiveRecord::Migration[6.0]
  def change
    add_column :bookmarks, :jobs_count, :integer
  end
end

