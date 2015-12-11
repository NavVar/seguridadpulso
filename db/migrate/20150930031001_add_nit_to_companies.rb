class AddNitToCompanies < ActiveRecord::Migration
  def change
    add_column :companies, :nit, :string
  end
end
