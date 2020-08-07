class CreateFavoriteBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :favorite_boards do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :board, null: false, foreign_key: true
      t.integer :position

      t.timestamps
    end
  end
end
