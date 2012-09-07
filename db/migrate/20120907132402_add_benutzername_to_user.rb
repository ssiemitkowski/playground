class AddBenutzernameToUser < ActiveRecord::Migration
  def change
    add_column :users, :benutzername, :string

  end
end
