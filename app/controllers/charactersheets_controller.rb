class CharactersheetsController < ApplicationController
  def new
    if user_signed_in?
      @charactersheet = Charactersheet.new
      @user = current_user
    else
      flash[:notice] = 'Please sign in to add a character sheet'
      redirect_to new_user_session_path
    end
  end

  def create
    if user_signed_in?
      @sheet = Charactersheet.create(sheet_params)
      @sheet.user = current_user
      @user_id = current_user.id

      if @sheet.save
        flash[:notice] = 'Your character sheet has been created'
        redirect_to user_charactersheet_path(@user_id, @sheet)
      else
        flash[:notice] = @game.errors.full_messages.to_sentence
        redirect_back(fallback_location: root_path)
      end
    else
      flash[:alert] = 'Please sign in to add a character sheet'
      redirect_to new_user_session_path
    end
  end

  def show
    @sheet = Charactersheet.find(params[:id])
    unless (user_signed_in? && ((current_user == @sheet.user) || ( @sheet.charviews.where(user: current_user) != [] )))
      flash[:notice] = 'You do not have permission to view this item'
      redirect_back(fallback_location: root_path)
    end
  end

  def edit
    @charactersheet = Charactersheet.find(params[:id])
    @user = @charactersheet.user
    if user_signed_in?
      unless current_user == @user
        flash[:alert] = "UNAUTHORIZED"
        redirect_back(fallback_location: root_path)
      end
    else
      flash[:alert] = "UNAUTHORIZED"
      redirect_back(fallback_location: root_path)
    end
  end

  def update
    @charactersheet = Charactersheet.find(params[:id])
    @charactersheet.update_attributes(sheet_params)
    if @charactersheet.save
      flash[:notice] = "Thank you for editing this character!"
      redirect_to user_charactersheet_path(@charactersheet)
    else
      flash[:notice] = @charactersheet.errors.full_messages.to_sentence
      render :edit
    end
  end

  private

  def sheet_params
    params.require(:charactersheet).permit(
      :name,
      :race,
      :age,
      :alignment,
      :classtype,
      :level,
      :abilities,
      :description,
      :backstory,
      :appearance,
      :languages,
      :equipment,
      :weapons,
      :spells,
      :gold,
      :other,
      :url
    )
  end
end
