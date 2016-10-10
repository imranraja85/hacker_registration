class Hacker < ApplicationRecord
  POSITIONS = {FULL_TIME: 'Full-time', PART_TIME: 'Part-time'}

  validates :first_name, :last_name, :email, :github_id, :position, presence: true

  def self.pick_winner(num = 1)
    return if count < num
    offset(rand(count - num)).limit(num).each do |hacker|
      hacker.winner = true
      hacker.save
    end
  end
end
