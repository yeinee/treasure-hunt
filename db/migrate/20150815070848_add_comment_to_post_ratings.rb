class AddCommentToPostRatings < ActiveRecord::Migration
  def change
    add_column :post_ratings, :comment, :text
  end
end
