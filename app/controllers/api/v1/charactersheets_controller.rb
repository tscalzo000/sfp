class Api::V1::CharactersheetsController < ApplicationController
  def show
    @charactersheet = Charactersheet.find(params[:id])
    @user = @charactersheet.user
    @current = current_user

    render json: { user: @user, sheet: @charactersheet, current: @current }
    # passing in user and review through ajax call in react
    # http://localhost:3000/api/v1/charactersheets/1.json to see the object
  end
end
