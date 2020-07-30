class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.belongs_to :board, null: false, foreign_key: true
      t.datetime :deleted_at
      t.string :ip_address
      t.string :serial

      t.timestamps
    end
    add_index :posts, :deleted_at
    add_index :posts, :serial, unique: true
  end
end
