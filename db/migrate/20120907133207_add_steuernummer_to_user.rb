class AddSteuernummerToUser < ActiveRecord::Migration
  def change
    add_column :users, :steuernummer, :string

  end
end
