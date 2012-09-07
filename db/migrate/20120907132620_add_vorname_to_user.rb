class AddVornameToUser < ActiveRecord::Migration
  def change
    add_column :users, :vorname, :string

  end
end
