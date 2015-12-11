class CreateRateclasses < ActiveRecord::Migration
  def change
    create_table :rateclasses do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
