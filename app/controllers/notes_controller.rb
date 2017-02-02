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
    else
      flash[:notice] = 'Error'
    end
    redirect_to game_path(@game)
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
    else
      flash[:notice] = 'Error'
    end
    redirect_to game_path(@game)
  end

  private

  def note_params
    params.require(:note).permit(
      :title,
      :body
    )
  end
end
