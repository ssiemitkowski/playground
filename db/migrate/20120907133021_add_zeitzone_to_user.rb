class AddZeitzoneToUser < ActiveRecord::Migration
  def change
    add_column :users, :zeitzone, :string

  end
end
