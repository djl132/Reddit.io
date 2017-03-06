class CreateAds < ActiveRecord::Migration[5.0]
  def change
    create_table :ads do |t|
      t.string :title
      t.text :body
      t.integer :price

      t.timestamps
    end
  end
end
