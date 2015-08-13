class CreateEngageStates < ActiveRecord::Migration
  def change
    create_table :engage_states do |t|
      t.references :user, index: true
      t.references :post, index: true
      t.integer :question_number

      t.timestamps
    end
  end
end
