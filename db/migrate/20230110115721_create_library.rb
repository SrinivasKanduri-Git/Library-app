class CreateLibrary < ActiveRecord::Migration[7.0]
  def change
    create_table :libraries do |t|
      t.string :lib_name
      t.timestamps
    end
  end
end
