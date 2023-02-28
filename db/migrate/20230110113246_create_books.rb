class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :no_of_pages
      t.date :publication_date
      t.text :summary
      t.boolean :availability, :default => false
      t.timestamps
    end
  end
end
