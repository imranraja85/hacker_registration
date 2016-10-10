require 'rails_helper'

RSpec.describe Hacker, type: :model do
  describe 'validation tests' do
    let(:hacker) { create(:hacker) }

    it 'should be valid strait from the factory' do
      expect(hacker).to be_valid
    end

    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:position) }
  end

  describe 'raffle tests' do
    let(:hackers) { 4.times { create(:hacker) } }

    before { hackers }

    it 'sets the winner flag to true' do
      expect(Hacker.pick_winner.winner).to eq(true)
    end

    it 'does not select a previous winner' do
      winners = []
      Hacker.all.each do |h|
        if h.winner
          expect(winners).to_not include(h.pick_winner.id)
          winners << h.id
        end
      end
    end

    it 'returns nil if no winner found' do
      Hacker.all.each do |h|
        h.winner = true
        h.save
      end
      
      expect(Hacker.pick_winner).to be_nil
    end
  end
end
