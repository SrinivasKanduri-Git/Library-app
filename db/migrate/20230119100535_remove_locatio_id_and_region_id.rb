class RemoveLocatioIdAndRegionId < ActiveRecord::Migration[7.0]
  def change
    remove_column :libraries, :location_id, :int
  end
end
