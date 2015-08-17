class AddAnswerToEngageStates < ActiveRecord::Migration
  def change
    add_column :engage_states, :answer, :string
  end
end
