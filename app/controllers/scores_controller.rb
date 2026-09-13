class ScoresController < ApplicationController
  def create
    @match = Match.find(params[:match_id])
    @score = @match.scores.build(score_params)
    if @score.save
      redirect_to match_path(@match), notice: "得点を記録しました！"
    else
      redirect_to match_path(@match), alert: "得点の記録に失敗しました。"
    end
  end

  def destroy
    @match = Match.find(params[:match_id])
    @score = @match.scores.find(params[:id])
    @score.destroy
    redirect_to match_path(@match), notice: "得点を削除しました！"
  end

  private

  def score_params
    params.require(:score).permit(:player_id, :assist_player_id)
  end
end
