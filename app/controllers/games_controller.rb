class GamesController < ApplicationController
  def index
    @games = Game.order(name: :desc)
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def delete
  end

end
