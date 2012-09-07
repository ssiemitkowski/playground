class AddHausnummerToUser < ActiveRecord::Migration
  def change
    add_column :users, :hausnummer, :string

  end
end
