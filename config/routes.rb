Rails.application.routes.draw do
  root 'hackers#new'
  resources :hackers
end
