class GameHistoriesController < ApplicationController
  before_action :set_game_history, only: [:show, :edit, :update, :destroy]
  before_action :set_user

  # GET /game_histories
  # GET /game_histories.json
  def index
    @game_histories = GameHistory.where(user_id: @user.id)
  end

  # GET /game_histories/1
  # GET /game_histories/1.json
  def show
    @game_history = GameHistory.find(params[:id])
    @game = @game_history.game
  end

  # GET /game_histories/new
  def new
    @game_history = GameHistory.new
  end

  # GET /game_histories/1/edit
  def edit
  end

  # POST /game_histories
  # POST /game_histories.json
  def create
    @game_history = GameHistory.new(game_history_params)

    respond_to do |format|
      if @game_history.save
        format.html { redirect_to @game_history, notice: 'Game history was successfully created.' }
        format.json { render :show, status: :created, location: @game_history }
      else
        format.html { render :new }
        format.json { render json: @game_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /game_histories/1
  # PATCH/PUT /game_histories/1.json
  def update
    respond_to do |format|
      if @game_history.update(game_history_params)
        format.html { redirect_to @game_history, notice: 'Game history was successfully updated.' }
        format.json { render :show, status: :ok, location: @game_history }
      else
        format.html { render :edit }
        format.json { render json: @game_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /game_histories/1
  # DELETE /game_histories/1.json
  def destroy
    @game_history.destroy
    respond_to do |format|
      format.html { redirect_to game_histories_url, notice: 'Game history was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def select_game
    @game_history = GameHistory.find_by(user_id: params[:user_id], user_game_history_id: params[:user_game_history_id])
    
    if @game_history
      redirect_to user_game_history_path(params[:user_id], @game_history)
    else
      flash[:alert] = "Game history not found."
      redirect_to user_game_histories_path(params[:user_id])
    end
  end  

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game_history
      @game_history = GameHistory.find(params[:id])
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    # Only allow a list of trusted parameters through.
    def game_history_params
      params.require(:game_history).permit(:game_id, :user_id, :date_played)
    end
end
