class AddSalepriceToExchanges < ActiveRecord::Migration
  def change
    add_column :exchanges, :saleprice, :float
  end
end
