Rails.application.routes.draw do
  devise_for :admins
  root 'hackers#new'
  resources :hackers do
    collection do
      get :thank_you
    end
  end
end
