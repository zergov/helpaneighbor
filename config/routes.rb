Rails.application.routes.draw do
  root to: 'home#show', as: :homepage

  get '/request-help', to: 'help_requests#new'
  post '/request-help', to: 'help_requests#create'
end
