class CreateExchanges < ActiveRecord::Migration
  def change
    create_table :exchanges do |t|
      t.date :to_date
      t.integer :buy_value
      t.references :ratetype, index: true, foreign_key: true
      t.references :rateclass, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
