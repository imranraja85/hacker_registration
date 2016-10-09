class HackersController < ApplicationController
  def new
    @hacker = Hacker.new
  end

  def create
    @hacker = Hacker.new(hacker_params)
    @hacker.save!
    redirect_to :back
  end
end
