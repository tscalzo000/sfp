class NotesController < ApplicationController
  def new
    @note = Note.new
    @games = []
    current_user.games.each do |game|
      @games << game.name
    end
  end

  def create
    @note = Note.create(note_params)
    @game = Game.where(name: params[:note][:game]).first
    @note.game = @game
    @note.user = current_user

    if @note.save
      flash[:notice] = 'Note saved'
      redirect_to game_path(@game)
    else
      flash[:notice] = 'Error'
      redirect_to game_path(@game)
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])
    @note.update_attributes(note_params)
    @game = @note.game

    if @note.save
      flash[:notice] = 'Note saved'
      redirect_to game_path(@game)
    else
      flash[:notice] = 'Error'
      redirect_to game_path(@game)
    end
  end

  private

  def note_params
    params.require(:note).permit(
      :title,
      :body
    )
  end
end
