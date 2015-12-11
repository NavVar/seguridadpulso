class AddConfirmedToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :confirmed, :boolean
  end
end
