class CreateOpponents < ActiveRecord::Migration[6.1]
  def change
    create_table :opponents do |t|
      t.text :name

      t.timestamps
    end
  end
end
