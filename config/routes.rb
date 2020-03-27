Rails.application.routes.draw do
  root to: 'home#show', as: :homepage

  get '/help-requests', to: 'help_requests#new'
  get '/help-requests/:id', to: 'help_requests#show'
  post '/help-requests', to: 'help_requests#create'
  get '/find-requests', to: 'help_requests#find'

  get '/help-now', to: 'help_now#show'
end
