require "rails_helper"

RSpec.describe HackerNotifierMailer, type: :mailer do
  it 'sends the winner email to the correct person with the correct subject and body' do
    hacker = create(:hacker)
    email = HackerNotifierMailer.send_winner_email(hacker)
    email.deliver_now
    email_body = Rails.root.join('spec', 'fixtures', 'hacker_notifier_mailer', 'send_winner_email.yml')

    expect(email.from).to eq(['noreply@example.com'])
    expect(email.to).to eq(['ace@example.com'])
    expect(email.subject).to eq("Congratulations! You've the won raffle. Come claim your prize!")
  end
end
