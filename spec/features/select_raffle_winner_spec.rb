require 'rails_helper'

describe 'running a raffle' do
  let!(:hackers) { 10.times { create(:hacker) } }

  it 'marks a winner' do
    admin = create(:admin)
    login_as(admin, :scope => :admin)

    visit '/admin/hackers'
    expect(page).to_not have_content('winner')
    click_on('Run Raffle')
    expect(page).to have_content('winner')
  end
end

