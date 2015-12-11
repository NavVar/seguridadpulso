class CreateDevelopmentRates < ActiveRecord::Migration
  def change
    create_table :development_rates do |t|
      t.string :name
      t.text :description

      t.timestamps null: false
    end
  end
end
