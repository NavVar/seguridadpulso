class AddDevelopmentRateToRateRegisters < ActiveRecord::Migration
  def change
    add_reference :rate_registers, :development_rate, index: true, foreign_key: true
  end
end
