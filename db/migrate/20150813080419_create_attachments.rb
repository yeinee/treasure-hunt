class CreateAttachments < ActiveRecord::Migration
  def change
    create_table :attachments do |t|
      t.references :parent, index: true
      t.string :parent_type
      t.string :file

      t.timestamps
    end
  end
end
