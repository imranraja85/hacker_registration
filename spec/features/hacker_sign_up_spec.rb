require 'rails_helper'

describe 'the hacker sign up process' do
  it 'signs me up' do
    visit '/'

    within(".hacker-new") do
      fill_in 'First Name', with: 'Frank'
      fill_in 'Last Name', with: 'Underwood'
      fill_in 'Your email address', with: 'franky@wh.com'
      fill_in 'Your GitHub username', with: 'frankie'
      select Hacker::POSITIONS[:FULL_TIME], from: 'hacker[position]'

      click_on('Submit Profile')

      expect(page.body).to have_content('Thanks for submitting your info!')
    end
  end

  it 'requires me to enter my email address' do
    visit '/'

    within(".hacker-new") do
      fill_in 'First Name', with: 'Frank'
      fill_in 'Last Name', with: 'Underwood'
      fill_in 'Your GitHub username', with: 'frankie'
      select Hacker::POSITIONS[:FULL_TIME], from: 'hacker[position]'

      click_on('Submit Profile')

      expect(page.body).to have_content('Email can\'t be blank')
    end
  end
end
