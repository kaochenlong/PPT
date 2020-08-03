class CreateBoardMasters < ActiveRecord::Migration[6.0]
  def change
    create_table :board_masters do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :board, null: false, foreign_key: true

      t.timestamps
    end
  end
end
