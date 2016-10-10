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
    let(:hackers) { 4.times {create(:hacker)} }

    before { hackers }

    it 'selects one winner' do
      expect(Hacker.pick_winner.count).to eq(1)
    end

    it 'sets the winner flag to true' do
      expect(Hacker.pick_winner.first.winner).to eq(true)
    end

    it 'selects 3 winners' do
      expect(Hacker.pick_winner(3).count).to eq(3)
    end

    it 'selects 3 winners and sets the flag' do
      Hacker.pick_winner(3).each do |h|
        expect(h.winner).to eq(true)
      end
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
  end
end
