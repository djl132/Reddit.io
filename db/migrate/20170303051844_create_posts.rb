class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end

# DOES SHOULDA SOMEHOW TELL THE POSTS TABLE TO READ THE ID OF A TOPIC IT IS PART OF ?
# WHERE IS THE REFERENCE? LIEK THE ONE WE USED IN COMMETNS?
#       t.references :post, foreign_key: true
