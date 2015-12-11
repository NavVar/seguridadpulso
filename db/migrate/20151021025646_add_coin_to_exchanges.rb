class AddCoinToExchanges < ActiveRecord::Migration
  def change
    add_column :exchanges, :coin, :string
  end
end
