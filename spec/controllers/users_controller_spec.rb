require 'rails_helper'

describe UsersController, type: :controller do
  include Devise::Test::ControllerHelpers

  it "renders the show view" do
    user = FactoryGirl.create(:user)
    sign_in user
    get :show, id: user.id
    assigns(:user).should eq(user)
    expect(response).to render_template :show
  end
end
