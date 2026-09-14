class MatchesController < ApplicationController
  def index
    # 今シーズンの戦績計算用（ページをめくっても全試合分を対象にする）
    @all_matches = Match.all

    # ページネーション用（最新の試合順で5件ずつ取得）
    @matches = Match.order(match_date: :desc, kickoff_time: :desc)
                    .page(params[:page])
                    .per(5)
  end

  def show
    @match = Match.find(params[:id])
    @score = Score.new
    @match_comment = MatchComment.new
    @players = Player.order(:number)
  end

  def new
    @match = Match.new
    @opponents = Opponent.all
  end

  def create
    @match = Match.new(match_params)
    if @match.save
      redirect_to matches_path, notice: "試合結果を記録しました！"
    else
      render :new
    end
  end

  def edit
    @match = Match.find(params[:id])
    @opponents = Opponent.all
  end

  def update
    @match = Match.find(params[:id])
    if @match.update(match_params)
      redirect_to match_path(@match), notice: "試合結果を更新しました！"
    else
      render :edit
    end
  end

  private

  def match_params
    params.require(:match).permit(
      :opponent_id,
      :match_date,
      :kickoff_time,
      :our_first_half,
      :our_second_half,
      :opp_first_half,
      :opp_second_half
    )
  end
end
