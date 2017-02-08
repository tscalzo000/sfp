class CharviewsController < ApplicationController
  def new
    @charview = Charview.new
    @chars = []
    current_user.charactersheets.each do |sheet|
      @chars << [sheet.name, sheet.id]
    end
  end

  def create
    @charview = Charview.new
    @charview.charactersheet = Charactersheet.find(params[:charview][:charactersheet])
    @charview.user = User.where(username: params[:charview][:user]).first
    if @charview.save
      flash[:notice] = 'Shared view created'
      redirect_to user_path(current_user)
    else
      flash[:alert] = 'Error. Please make sure the user\'s name is spelled correctly'
      redirect_back(fallback_location: user_path(current_user))
    end
  end

  def destroy
    @charview = Charview.find(params[:id])
    @charview.delete
    flash[:notice] = 'Shared view deleted'
    redirect_to user_path(current_user)
  end

end
