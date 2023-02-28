class CreateRegionLibraries < ActiveRecord::Migration[7.0]
  def change
    create_table :region_libraries do |t|
      t.integer :region_id
      t.integer :library_id
      t.timestamps
    end
  end
end
