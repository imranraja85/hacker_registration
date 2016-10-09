class HackersController < ApplicationController
  def new
    @hacker = Hacker.new
  end

  def create
    @hacker = Hacker.new(hacker_params)

    if @hacker.save
      render :thank_you
    else
      flash.now[:error] = "Could not save your info"
      render :new
    end
  end

  private

  def hacker_params
    params.require(:hacker).permit(:first_name, :last_name, :email, :github_id, :position)
  end
end
