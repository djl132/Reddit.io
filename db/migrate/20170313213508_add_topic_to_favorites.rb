class AddTopicToFavorites < ActiveRecord::Migration[5.0]
  def change
    add_reference :favorites, :topic, foreign_key: true
  end
end
