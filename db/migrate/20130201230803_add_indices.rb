class AddIndices < ActiveRecord::Migration
  def change
    add_index :users, :name, unique: true
    add_index :users, :session_token, unique: true
  end
end
