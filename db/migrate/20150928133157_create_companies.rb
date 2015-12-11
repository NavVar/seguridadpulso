class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.text :background
      t.string :location
      t.string :contact_reference

      t.timestamps null: false
    end
  end
end
