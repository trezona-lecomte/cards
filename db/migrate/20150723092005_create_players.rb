class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.references :game, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
