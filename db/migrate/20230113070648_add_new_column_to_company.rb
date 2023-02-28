class AddNewColumnToCompany < ActiveRecord::Migration[7.0]
  def change
    add_column :companies, :established_on, :date
    add_column :regions, :company_id, :int
  end
end
