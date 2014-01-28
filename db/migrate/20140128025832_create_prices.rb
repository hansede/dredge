class CreatePrices < ActiveRecord::Migration
  def change
    create_table :prices do |t|
      t.decimal :high
      t.decimal :medium
      t.decimal :low

      t.timestamps
    end
  end
end
