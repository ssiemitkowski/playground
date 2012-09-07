class AddNachnameToUser < ActiveRecord::Migration
  def change
    add_column :users, :nachname, :string

  end
end
