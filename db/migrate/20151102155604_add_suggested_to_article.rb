class AddSuggestedToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :suggested, :boolean
  end
end
