require 'rails_helper'

describe GamesController, type: :controller do
  include Devise::Test::ControllerHelpers
  
  it "renders the index view" do
    get :index
    expect(response).to render_template :index
  end

  it "renders a show page" do
    game = FactoryGirl.create(:game)
    user = FactoryGirl.create(:user)
    sign_in user
    get :show, params: { id: game.id }
    expect(assigns(:game)).to eq(game)
    expect(response).to render_template :show
  end
end
