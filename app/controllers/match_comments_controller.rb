class MatchCommentsController < ApplicationController
  def create
    @match = Match.find(params[:match_id])
    @comment = @match.match_comments.build(match_comment_params)
    if @comment.save
      redirect_to match_path(@match), notice: "コメントを投稿しました"
    else
      redirect_to match_path(@match), alert: "コメントの投稿に失敗しました"
    end
  end

  def destroy
    @comment = MatchComment.find(params[:id])
    @match = @comment.match
    @comment.destroy
    redirect_to match_path(@match), notice: "コメントを削除しました", status: :see_other
  end

  private

  def match_comment_params
    params.require(:match_comment).permit(:comment, :player_id)
  end
end
