class AddRateValueToRateRegisters < ActiveRecord::Migration
  def change
    add_column :rate_registers, :rate_value, :float
  end
end
