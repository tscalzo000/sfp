class NotesController < ApplicationController
  def new
    @user = current_user
    if @user.games == []
      flash[:notice] = 'You need to join a game in order to create notes'
      redirect_back(fallback_location: user_path(@user))
    else
      @note = Note.new
      @games = []
      current_user.games.each do |game|
        @games << game.name
      end
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

  def destroy
    @note = Note.find(params[:id])
    @game = @note.game

    if @note.delete
      flash[:notice] = 'Note deleted'
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
