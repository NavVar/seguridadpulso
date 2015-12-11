class RemoveRateValueFromRateRegisters < ActiveRecord::Migration
  def change
    remove_column :rate_registers, :rate_value, :integer
  end
end
