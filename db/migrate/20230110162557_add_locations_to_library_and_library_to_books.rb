class AddLocationsToLibraryAndLibraryToBooks < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :library_id, :int
    add_column :libraries, :location_id, :int
  end
end
