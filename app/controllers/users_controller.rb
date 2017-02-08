class UsersController < ApplicationController
  def show
    if user_signed_in?
      @user = current_user
      @views = []
      @user.charactersheets.each do |sheet|
        @views += sheet.charviews
      end
      @charview = Charview.new
    else
      flash[:notice] = 'Please sign in first'
      redirect_to new_user_session_path
    end
  end
end
