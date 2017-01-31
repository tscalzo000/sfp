require 'rails_helper'

describe Game, type: :model do
  it { should have_valid(:name).when('Game', 'Name') }
  it { should have_valid(:description).when('Testdesc', 'Testing this stuff') }
  it { should have_valid(:playernum).when(1, 100) }
  it { should have_valid(:dm_id).when(1, 100) }
  it { should have_valid(:gametype).when('type_ex', 'D&D 5e') }
  it { should have_valid(:location).when('Address', '300 Main Street, Boston') }
  it { should have_valid(:time).when('5:00pm', 'noon') }
  it { should have_valid(:day).when('Monday', 'Tuesday') }
  it { should have_valid(:frequency).when('weekly', 'monthly') }
  it { should have_valid(:cover).when('test.png', 'testimage.google.com') }

  it { should_not have_valid(:name).when('', nil) }
  it { should_not have_valid(:description).when('', nil) }
  it { should_not have_valid(:playernum).when('', nil, 'test') }
  it { should_not have_valid(:dm_id).when('', nil, 'test') }
  it { should_not have_valid(:gametype).when('', nil) }
  it { should_not have_valid(:location).when('', nil) }
  it { should_not have_valid(:time).when('', nil) }
  it { should_not have_valid(:day).when('anyday', '', nil) }
  it { should_not have_valid(:frequency).when('', nil) }
end
