require 'csv'

class Hacker < ApplicationRecord
  POSITIONS = {
		FULL_POSITION: 'Full-time',
		PART_POSITION: 'Part-time'
	}
  
  validates :first_name, :last_name, :email, :github_id, :position, presence: true

  def self.pick_winner(num = 1)
    return if count < num
    offset(rand(count - num)).limit(num).each do |h|
      h.winner = true
      h.save
    end
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
