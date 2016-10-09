class Hacker < ApplicationRecord
  FULL_POSITION='Full-time'
  PART_POSITION='Part-time'
  
  validates :first_name, :last_name, :email, :github_id, :position, presence: true

  def self.pick_winner(num = 1)
    return if count < num
    offset(rand(count - num)).limit(num).each do |h|
      h.winner = true
      h.save
    end
  end
end
