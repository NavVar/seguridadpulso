class CreateCoinrates < ActiveRecord::Migration
  def change
    create_table :coinrates do |t|
      t.float :sale
      t.float :buy
      t.date :todate
      t.references :ratetype, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
