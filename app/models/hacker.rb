class Hacker < ApplicationRecord

  validates :first_name, :last_name, :email, :github_id, :position, presence: true
end
