class Opponent < ApplicationRecord
  has_one_attached :image
  has_many :matches, dependent: :destroy

  # 直近の試合（最新の日付のもの）
  def latest_match
    matches.order(match_date: :desc).first
  end

  # 通算試合数
  def total_matches_count
    matches.count
  end

  # 通算勝利数
  def wins_count
    matches.to_a.count(&:won?)
  end

  # 通算敗戦数
  def losses_count
    matches.to_a.count(&:lost?)
  end

  # 通算引分数
  def draws_count
    matches.to_a.count(&:drawn?)
  end
end
