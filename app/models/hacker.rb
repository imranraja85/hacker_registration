require 'csv'

class Hacker < ApplicationRecord
  POSITIONS = { FULL_TIME: 'Full-time', PART_TIME: 'Part-time' }.freeze

  validates :first_name, :last_name, :email, :github_id, :position, presence: true

  # Picks a random single winner that has not won before, returns nil if no
  # winner is found.
  def self.pick_winner
    count.times do
      hacker = offset(rand(count)).limit(1).first
      next if hacker.winner

      hacker.winner = true
      if hacker.save
        HackerNotifierMailer.send_winner_email(hacker).deliver  
        return hacker
      end
    end

    return
  end

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |hacker|
        csv << hacker.attributes.values_at(*column_names)
      end
    end
  end
end
