class AddAnredeToUser < ActiveRecord::Migration
  def change
    add_column :users, :anrede, :string

  end
end
