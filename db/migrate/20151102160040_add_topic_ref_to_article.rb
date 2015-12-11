class AddTopicRefToArticle < ActiveRecord::Migration
  def change
    add_reference :articles, :topic, index: true, foreign_key: true
  end
end
