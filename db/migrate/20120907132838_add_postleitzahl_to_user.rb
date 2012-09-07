class AddPostleitzahlToUser < ActiveRecord::Migration
  def change
    add_column :users, :postleitzahl, :number

  end
end
