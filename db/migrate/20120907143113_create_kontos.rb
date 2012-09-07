class CreateKontos < ActiveRecord::Migration
  def change
    create_table :kontos do |t|
      t.string :title
      t.string :status

      t.timestamps
    end
  end
end
