require 'drop_dead_dice_game/auto_drop_dead'
require 'drop_dead_dice_game/die'
require 'drop_dead_dice_game/game_play'
require 'drop_dead_dice_game/player'

class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy, :repeat]

  # GET /games
  # GET /games.json
  def index
    @games = Game.all
  end

  # GET /games/1
  # GET /games/1.json
  def show
    @game = Game.find(params[:id])
    @user = User.find(params[:user_id])
    @result = run_auto_drop_dead(@game.num_players, @game.num_sides, @game.num_dice)
  end

  # GET /games/new
  def new
    @game = Game.new
    @user = User.find(params[:user_id])
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  # POST /games.json
  def create
    @user = User.find(params[:user_id])
    @game = @user.games.build(game_params) 
    # @game = Game.new(game_params)

    respond_to do |format|
      if @game.save
        @result = run_auto_drop_dead(@game.num_players, @game.num_sides, @game.num_dice)
        @game.update(result: @result)
        @game_history = GameHistory.create(game_id: @game.id, user_id: @user.id, date_played: Time.current.in_time_zone("EST"))

        format.html { redirect_to user_game_path(@user, @game), notice: 'Game was successfully created.' }
        format.json { render :show, status: :created, location: @game }
      else
        flash.now[:error] = @game.errors.full_messages.join(", ")
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /games/1
  # PATCH/PUT /games/1.json
  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /games/1
  # DELETE /games/1.json
  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # repeats the game by creating a new game instance with the same parameters
  def repeat
    @user = User.find(params[:user_id])
    @game = Game.find(params[:id])
    @result = run_auto_drop_dead(@game.num_players, @game.num_sides, @game.num_dice)
    @new_game = @user.games.create(num_players: @game.num_players, num_sides: @game.num_sides, num_dice: @game.num_dice, result: @result)
    GameHistory.create(game_id: @new_game.id, user_id: @user.id, date_played: Time.current.in_time_zone("EST"))
    redirect_to user_game_path(@user, @new_game)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def game_params
      params.require(:game).permit(:num_players, :num_sides, :num_dice, :result, :user_id)
    end

    def run_auto_drop_dead(num_players, num_sides, num_dice)
      result = AutoDropDead.new.play_game(num_sides, num_dice, num_players)
      result
    end
end
