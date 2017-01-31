require 'rails_helper'

describe GamesController, type: :controller do
  it "renders the index view" do
    get :index
    expect(response).to render_template :index
  end

  it "renders a show page" do
    game = FactoryGirl.create(:game)
    get :show, id: game.id
    assigns(:game).should eq(game)
    expect(response).to render_template :show
  end
end
