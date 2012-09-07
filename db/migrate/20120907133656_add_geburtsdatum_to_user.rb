class AddGeburtsdatumToUser < ActiveRecord::Migration
  def change
    add_column :users, :geburtsdatum, :date

  end
end
