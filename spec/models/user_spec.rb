require 'rails_helper'

describe User, type: :model do
  it { should have_valid(:username).when('Person', 'Bubba') }
  it { should have_valid(:email).when('Person@google.com', 'Bubba@cvs.com') }
  it { should have_valid(:password).when('Personpw', 'Bubbapw') }

  it { should_not have_valid(:username).when('', nil) }
  it { should_not have_valid(:email).when('', nil, 'Bubba') }
  it { should_not have_valid(:password).when('', nil) }

  it 'has a matching password confirmation for the password' do
    user = User.new
    user.password = 'password'
    user.password_confirmation = 'anotherpassword'
    expect(user).to_not be_valid
    expect(user.errors[:password_confirmation]).to_not be_blank
  end
end
