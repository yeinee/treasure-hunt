class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.references :user, index: true
      t.string :title
      t.text :description
      t.boolean :is_complete
      t.references :hunter, index: true

      t.timestamps
    end
  end
end
