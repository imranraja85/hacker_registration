require 'rails_helper'

describe 'list of hackers' do
  let!(:hackers) { 2.times { create(:hacker) } }

  it 'exports all hackers' do
    admin = create(:admin)
    login_as(admin, :scope => :admin)
    visit('/admin/hackers')

    click_on('Export Hackers')
    expect(page).to have_content(Hacker.column_names.join(","))
    expect(page).to have_content("Hacker1")
    expect(page).to have_content("Hacker2")
  end
end
