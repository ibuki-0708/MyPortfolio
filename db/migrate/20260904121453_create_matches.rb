class CreateMatches < ActiveRecord::Migration[6.1]
  def change
    create_table :matches do |t|
      t.integer :opponent_id
      t.date :match_date
      t.time :kickoff_time
      t.string :venue
      t.integer :our_first_half
      t.integer :our_second_half
      t.integer :opp_first_half
      t.integer :opp_second_half

      t.timestamps
    end
  end
end
