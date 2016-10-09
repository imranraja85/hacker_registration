FactoryGirl.define do
  factory :hacker do
    first_name 'Joe'
    last_name  'Hacker'
    github_id  'Ace-Hack'
    position 'full-time'
    email 'ace@example.com'
    winner false
  end
end
