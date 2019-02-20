class CreateComments < ActiveRecord::Migration[5.2]
  def change
    create_table :comments do |t|
      t.text :content, null: false
      t.references :user, foreign_key: true
      t.references :commentable, polymorphic: true
      t.integer :parant_id, default: nil

      t.timestamps
    end
  end
end
