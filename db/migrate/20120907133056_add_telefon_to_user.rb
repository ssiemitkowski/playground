class AddTelefonToUser < ActiveRecord::Migration
  def change
    add_column :users, :telefon, :string

  end
end
