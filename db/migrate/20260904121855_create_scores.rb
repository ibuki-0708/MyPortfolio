class CreateScores < ActiveRecord::Migration[6.1]
  def change
    create_table :scores do |t|
      t.references :match, null: false, foreign_key: true
      t.references :player, null: false, foreign_key: true
      t.references :assist_player,foreign_key: { to_table: :players }
      t.timestamps
    end
  end
end
