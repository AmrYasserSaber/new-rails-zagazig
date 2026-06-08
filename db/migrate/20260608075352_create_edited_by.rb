class CreateEditedBy < ActiveRecord::Migration[8.1]
  def change
    create_table :edited_bies do |t|
      t.references :user, null: false, foreign_key: true
      t.references :post, null: false, foreign_key: true
      t.text :body

      t.timestamps
    end
  end
end