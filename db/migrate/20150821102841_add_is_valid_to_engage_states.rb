class AddIsValidToEngageStates < ActiveRecord::Migration
  def change
    add_column :engage_states, :is_valid, :boolean
  end
end
