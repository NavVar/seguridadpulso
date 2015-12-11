class CreateRateRegisters < ActiveRecord::Migration
  def change
    create_table :rate_registers do |t|
      t.integer :rate_value
      t.datetime :date_registered

      t.timestamps null: false
    end
  end
end
