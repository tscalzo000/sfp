class RequestsController < ApplicationController
  def create
    @game = Game.find(params[:game_id])
    @request = Request.create(request_params)
    @request.user = current_user
    @request.game = @game

    if @request.save
      flash[:notice] = 'Thank you for applying to this game'
      redirect_to game_path(@game)
    else
      flash[:notice] = @request.errors.full_messages.to_sentence
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @request = Request.find(params[:id])
    @game = @request.game
    @request.delete
    flash[:alert] = "You have deleted the request successfully"
    redirect_to game_path(@game)
  end

  private

  def request_params
    params.require(:request).permit(
      :body
    )
  end
end
