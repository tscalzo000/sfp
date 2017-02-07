class SearchController < ApplicationController
  def index
    @games = []
    if params[:search]
      @search = params[:search]
      @games = Game.where('name  ~* ?', "#{@search}").order(name: :asc)
    end
  end

  def advanced
    @games = []
    @name = params[:name]
    @type = params[:type]
    @day = params[:day]
    @frequency = params[:freq]
    @dmname = params[:dm]
    if @dmname != ''
      @dm_id = User.where(username: @dmname)
    end
    if params[:name] || params[:type] || params[:day] || params[:freq] || params[:dm]
      @games = Game.where('name  ~* ?', "#{@name}").order(name: :asc)
      @games = @games.where('gametype  ~* ?', "#{@type}").order(name: :asc)
      @games = @games.where('day  ~* ?', "#{@day}").order(name: :asc)
      @games = @games.where('frequency  ~* ?', "#{@frequency}").order(name: :asc)
      if @dm_id
        @games = @games.where(dm_id: @dm_id).order(name: :asc)
      end
    end
  end
end
