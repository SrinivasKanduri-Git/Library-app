class CreateLocationLibraries < ActiveRecord::Migration[7.0]
  def change
    create_table :location_libraries do |t|
      t.integer :location_id
      t.integer :library_id
      t.timestamps
    end
  end
end
