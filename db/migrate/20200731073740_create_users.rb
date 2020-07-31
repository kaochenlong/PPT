class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :account
      t.string :password
      t.string :email
      t.string :nickname
      t.string :state, default: 'normal'
      t.datetime :deleted_at

      t.timestamps
    end
    add_index :users, :account, unique: true
    add_index :users, :email, unique: true
    add_index :users, :deleted_at
  end
end
