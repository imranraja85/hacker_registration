Rails.application.routes.draw do
  root 'hackers#new'
  resources :hackers do
    collection do
      get :thank_you
    end
  end
end
