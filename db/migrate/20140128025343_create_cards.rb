class CreateCards < ActiveRecord::Migration
  def change
    create_table :releases do |t|
      t.string :name

      t.timestamps
    end
    create_table :cards do |t|
      t.belongs_to :release
      t.string :name
      t.string :cmc
      t.string :card_type
      t.string :color
      t.string :rarity

      t.timestamps
    end

    create_table :prices do |t|
      t.belongs_to :card
      t.decimal :high
      t.decimal :medium
      t.decimal :low

      t.timestamps
    end
  end
end
