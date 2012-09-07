class AddBenutzerkennungToUser < ActiveRecord::Migration
  def change
    add_column :users, :benutzerkennung, :string

  end
end
