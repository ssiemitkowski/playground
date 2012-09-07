class AddLandToUser < ActiveRecord::Migration
  def change
    add_column :users, :land, :string

  end
end
