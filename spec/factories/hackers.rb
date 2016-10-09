FactoryGirl.define do
  sequence :first_name do |n|
    "Joe#{n}"
  end

  sequence :last_name do |l|
    "Hacker#{l}"
  end

  sequence :github_id do |g|
    "hacker-ace#{g}"
  end

  factory :hacker do
    first_name { generate(:first_name) }
    last_name  { generate(:last_name) }
    github_id  { generate(:github_id) }
    position 'full-time'
    email 'ace@example.com'
    winner false
  end
end
