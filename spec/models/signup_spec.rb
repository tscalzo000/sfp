require 'rails_helper'

describe Signup, type: :model do
  it { should have_valid(:game_id).when(1, 2) }
  it { should have_valid(:user_id).when(1, 2) }

  it { should_not have_valid(:game_id).when('', nil, 'Bubba') }
  it { should_not have_valid(:user_id).when('', nil, 'Bubba') }
end
