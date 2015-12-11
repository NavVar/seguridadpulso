class AddGoerToUser < ActiveRecord::Migration
  def change
    add_reference :users, :companygoer, index: true, foreign_key: true
  end
end
