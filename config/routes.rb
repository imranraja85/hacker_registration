Rails.application.routes.draw do
  root 'hackers#new'
  resources :hackers do
    get :thank_you
  end
end
