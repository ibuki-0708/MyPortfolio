class Player < ApplicationRecord
  has_one_attached :image
  has_many :match_comments, dependent: :destroy
  has_many :scores, dependent: :destroy
  has_many :assisted_scores,class_name: "Score",foreign_key: :assist_player_id

  enum :position, {
    GK: 0,
    DF: 1,
    MF: 2,
    FW: 3
  }
end
