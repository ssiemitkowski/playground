class AddOrtToUser < ActiveRecord::Migration
  def change
    add_column :users, :ort, :string

  end
end
