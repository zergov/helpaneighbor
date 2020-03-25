Rails.application.routes.draw do
  root to: 'home#show', as: :homepage

  resources :help_requests, path: '/help-requests'
end
