class AddRefToRatetypes < ActiveRecord::Migration
  def change
    add_reference :ratetypes, :rateclass, index: true, foreign_key: true
  end
end
