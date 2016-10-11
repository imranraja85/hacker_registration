require "rails_helper"

RSpec.describe HackerNotifierMailer, type: :mailer do
  it 'tests' do
    hacker = create(:hacker)
    email = HackerNotifierMailer.send_winner_email(hacker)
    email.deliver_now

    expect(email.from).to eq(['noreply@example.com'])
    expect(email.to).to eq(['ace@example.com'])
    expect(email.subject).to eq("Congratulations! You've the won raffle. Come claim your prize!")
binding.pry
    expect(email.body.to_s).to eq('hello')
  end
end
