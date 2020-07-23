class CreateBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :boards do |t|
      t.string :title
      t.text :intro
      t.datetime :deleted_at
      t.string :state, default: 'normal'

      t.timestamps
    end
    add_index :boards, :deleted_at
  end
end
