require 'rails_helper'

describe 'the admin login process' do
 context 'when I try and access a secure page' do
   it 'redirects me to the admin login screen' do
     visit '/admin/hackers'

     expect(page).to have_content('You need to sign in or sign up before continuing')
   end
 end

  context 'when i successfully authenticate' do
    it 'takes me to the hacker index page on login' do
      admin = create(:admin)
      login_as(admin, :scope => :admin)

      visit '/admin/hackers'

      expect(page).to have_content('Hackers List')
    end
  end
end
