class SignupsController < ApplicationController

  def new
    @signup = Signup.new
  end

  def create
    @game = Game.find(params[:game_id])
    if params[:signup][:user_id]
      @user = User.find(params[:signup][:user_id])
    elsif params[:signup][:user]
      @user = User.where(username: params[:signup][:user]).first
    end
    @signup = Signup.create(user: @user, game: @game)
    Request.where(user: @user, game: @game).delete_all
    if @signup.save
      flash[:notice] = "#{@signup.user.username} has been added to #{@signup.game.name}"
      redirect_to game_path(@game)
    else
      flash[:notice] = 'Error. Please make sure the username is spelled correctly, including capitalization'
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @signup = Signup.find(params[:id])
    @game = @signup.game
    @signup.delete
    flash[:notice] = 'Player has been removed from this game'
    redirect_back(fallback_location: game_path(@game))
  end

end
