class CreateRatetypes < ActiveRecord::Migration
  def change
    create_table :ratetypes do |t|
      t.string :name
      t.string :unit

      t.timestamps null: false
    end
  end
end
