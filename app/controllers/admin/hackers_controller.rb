class Admin::HackersController < Admin::AdminsController
  def index
    @hackers = Hacker.order("winner desc")

    respond_to do |format|
      format.html
      format.csv { send_data Hacker.to_csv }
    end
  end

  def select_winner
    winner = Hacker.pick_winner
    flash[:notice] = "#{winner.first_name} #{winner.last_name} has been selected as the raffle winner!"
    redirect_to admin_hackers_path
  end
end
