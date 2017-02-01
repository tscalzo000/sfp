class GamesController < ApplicationController
  def index
    @games = Game.order(created_at: :desc)
  end

  def show
    authenticate_user!
    @game = Game.find(params[:id])
    @request = Request.new
    @signup = Signup.new
  end

  def new
    if user_signed_in?
      @game = Game.new
    else
      flash[:notice] = 'Please sign in to add a game'
      redirect_to new_user_session_path
    end
  end

  def create
    if user_signed_in?
      @game = Game.create(game_params)

      if @game.save
        flash[:notice] = 'Thank you for adding this listing to our database!'
        Signup.create(user: current_user, game: @game)
        redirect_to game_path(@game)
      else
        flash[:notice] = @game.errors.full_messages.to_sentence
        redirect_back(fallback_location: root_path)
      end
    else
      flash[:alert] = 'Please sign in to add a game'
      redirect_to new_user_session_path
    end
  end

  def edit
    if user_signed_in?
      @game = Game.find(params[:id])
      unless current_user.id == @game.dm_id
        flash[:alert] = "UNAUTHORIZED"
        redirect_back(fallback_location: root_path)
      end
    else
      flash[:alert] = "UNAUTHORIZED"
      redirect_back(fallback_location: root_path)
    end
  end

  def update
    @game = Game.find(params[:id])
    @game.update_attributes(game_params)

    if @game.save
      flash[:notice] = "Thank you for editing this listing!"
      redirect_to game_path(@game)
    else
      flash[:notice] = @game.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @game = Game.find(params[:id])
    if user_signed_in? && (current_user.id == @game.dm_id)
      Comment.where(game: @game).delete_all
      Signup.where(game: @game).delete_all
      Request.where(game: @game).delete_all
      @game.delete
      flash[:alert] = "You have deleted this game listing successfully"
      redirect_to games_path
    else
      flash[:alert] = 'UNAUTHORIZED'
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def game_params
    params.require(:game).permit(
      :name,
      :description,
      :playernum,
      :dm_id,
      :gametype,
      :location,
      :time,
      :day,
      :frequency,
      :cover,
      :other
    )
  end
end
