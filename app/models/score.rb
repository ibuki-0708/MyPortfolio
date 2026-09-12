class Score < ApplicationRecord
  belongs_to :match
  belongs_to :player
  belongs_to :assist_player, class_name:"Player", foreign_key: :assist_player_id, optional:true
end
