class AddFirmaToUser < ActiveRecord::Migration
  def change
    add_column :users, :firma, :string

  end
end
