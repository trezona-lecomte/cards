class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.references :player, index: true, foreign_key: true
      t.references :game, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
