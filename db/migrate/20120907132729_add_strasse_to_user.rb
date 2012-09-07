class AddStrasseToUser < ActiveRecord::Migration
  def change
    add_column :users, :strasse, :string

  end
end
