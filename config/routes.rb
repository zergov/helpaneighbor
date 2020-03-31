Rails.application.routes.draw do
  root to: 'home#show', as: :homepage

  get   'languages', to: 'languages#index', as: :choose_language

  get     '/help-requests', to: 'help_requests#new', as: :new_help_request
  post    '/help-requests', to: 'help_requests#create'
  get     '/help-requests/:uuid', to: 'help_requests#show', as: :help_request
  get     '/help-requests/:uuid/edit', to: 'help_requests#edit', as: :edit_help_request
  patch   '/help-requests/:uuid/edit', to: 'help_requests#update'
  delete  '/help-requests/:uuid/edit', to: 'help_requests#delete'
  get     '/help-requests/:uuid/confirm-security-number', to: 'help_requests#ask_security_number', as: :help_request_confirm_security_number
  post    '/help-requests/:uuid/confirm-security-number', to: 'help_requests#confirm_security_number'

  get '/help-now', to: 'help_now#show'
  get '/help-now/search', to: 'help_now#search'
end
