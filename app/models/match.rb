class Match < ApplicationRecord
  belongs_to :opponent
  has_many :match_comments, dependent: :destroy
  has_many :scores, dependent: :destroy
end
