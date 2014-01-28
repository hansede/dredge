class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :name
      t.string :cmc
      t.string :type
      t.string :color
      t.string :rarity

      t.timestamps
    end
  end
end
