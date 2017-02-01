class CommentsController < ApplicationController

  def create
    @game = Game.find(params[:game_id])
    @comment = Comment.new(comment_params)
    @comment.game = @game
    @comment.user = current_user

    if @comment.save
      flash[:notice] = "Thank you for submitting your comment"
      redirect_to game_path(@game)
    else
      flash[:notice] = @comment.errors.full_messages.to_sentence
      redirect_back(fallback_location: game_path(@game))
    end
  end

  private

  def comment_params
    params.require(:comment).permit (
      :body
    )
  end
end
