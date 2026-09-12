class CreateMatchComments < ActiveRecord::Migration[6.1]
  def change
    create_table :match_comments do |t|
      t.integer :match_id
      t.integer :player_id
      t.text :comment

      t.timestamps
    end
  end
end
