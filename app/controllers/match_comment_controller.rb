class MatchCommentController < ApplicationController
  def create
    @match = Match.find(params[:match_id])
    @match_comment = @match.match_comments.build(match_comment_params)
    if @match_comment.save
      redirect_to match_path(@match), notice: "コメントを投稿しました！"
    else
      redirect_to match_path(@match), alert: "コメントの投稿に失敗しました。"
    end
  end

  def destroy
    @match = Match.find(params[:match_id])
    @match_comment = @match.match_comments.find(params[:id])
    @match_comment.destroy
    redirect_to match_path(@match), notice: "コメントを削除しました！"
  end

  private

  def match_comment_params
    params.require(:match_comment).permit(:comment)
  end
end
