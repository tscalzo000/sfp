FactoryGirl.define do
  factory :game do
    sequence(:name) { |n| 'testgame#{n}' }
    description 'This is a description'
    playernum 6
    dm_id 1
    gametype 'D&D 5e'
    location '123 Main Street, Boston MA 02122'
    time '12:00pm'
    day 'Saturday'
    frequency 'Weekly'
    cover 'test.png'
  end
end
