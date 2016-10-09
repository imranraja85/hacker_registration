Rails.application.routes.draw do
  devise_for :admins
  root 'hackers#new'

	namespace :admin do
    resources :hackers do
			collection do
				post :select_winner
			end
		end
	end

  resources :hackers, :only => [:new, :create] do
    collection do
      get :thank_you
    end
  end
end
