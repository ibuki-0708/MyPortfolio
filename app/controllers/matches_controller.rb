class MatchesController < ApplicationController
  def index
    @matches = Match.includes(:opponent, :match_comments).order(match_date: :desc)
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
