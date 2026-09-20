class OpponentsController < ApplicationController
  def index
    @opponents = Opponent.order(:name)
                         .page(params[:page])
                         .per(6)
  end

  def new
    @opponent = Opponent.new
  end

  def create
    @opponent = Opponent.new(opponent_params)
    if @opponent.save
      # 登録完了後、試合記録画面へ戻る
      redirect_to new_match_path, notice: "対戦チーム「#{@opponent.name}」を登録しました！"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @opponent = Opponent.find(params[:id])
  end

  def update
    @opponent = Opponent.find(params[:id])
    if @opponent.update(opponent_params)
      redirect_to opponents_path, notice: "対戦チーム「#{@opponent.name}」を更新しました！"
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def show
    @opponent = Opponent.find(params[:id])
    @matches = @opponent.matches.order(match_date: :desc)
  end

  

  private

  def opponent_params
    params.require(:opponent).permit(:name, :image)
  end
end
