class Match < ApplicationRecord
  belongs_to :opponent
  has_many :match_comments, dependent: :destroy
  has_many :scores, dependent: :destroy

  def our_total_score
    (our_first_half || 0) + (our_second_half || 0)
  end

  # 相手チームの合計得点（前半 + 後半）
  def opp_total_score
    (opp_first_half || 0) + (opp_second_half || 0)
  end

  # ------------------------------------
  # 勝敗判定（サマリー表示で使う）
  # ------------------------------------
  # 勝ち判定
  def won?
    our_total_score > opp_total_score
  end

  # 負け判定
  def lost?
    our_total_score < opp_total_score
  end

  # 引き分け判定
  def drawn?
    our_total_score == opp_total_score
  end
end
