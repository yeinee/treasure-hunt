class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.references :post, index: true
      t.integer :number
      t.text :content
      t.string :answer

      t.timestamps
    end
  end
end
