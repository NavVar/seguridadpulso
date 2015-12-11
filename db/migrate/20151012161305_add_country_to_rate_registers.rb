class AddCountryToRateRegisters < ActiveRecord::Migration
  def change
    add_reference :rate_registers, :country, index: true, foreign_key: true
  end
end
