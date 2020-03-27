Rails.application.routes.draw do
  root to: 'home#show', as: :homepage

  get '/help-requests', to: 'help_requests#new', as: :new_help_request
  get '/help-requests/:id', to: 'help_requests#show', as: :help_request
  post '/help-requests', to: 'help_requests#create', as: :help_requests
  get '/find-requests', to: 'help_requests#find'

  get '/help-now', to: 'help_now#show'
end
