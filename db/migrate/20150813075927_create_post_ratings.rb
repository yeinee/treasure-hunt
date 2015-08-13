class CreatePostRatings < ActiveRecord::Migration
  def change
    create_table :post_ratings do |t|
      t.references :post, index: true
      t.references :user, index: true
      t.float :rating

      t.timestamps
    end
  end
end
