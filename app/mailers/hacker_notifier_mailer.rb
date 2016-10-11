class HackerNotifierMailer < ApplicationMailer
  default :from => 'noreply@example.com'

  def send_winner_email(hacker)
    @hacker = hacker
    mail(to: @hacker.email,
         subject: "Congratulations! You've the won raffle. Come claim your prize!")
  end
end
