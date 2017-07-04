class AddColumnToMovies < ActiveRecord::Migration[5.1]
  def change
    add_column :movies, :has_shows, :boolean, default: false
  end
end
