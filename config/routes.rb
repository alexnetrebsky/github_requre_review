Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'github_events#index'
  post 'github_event', to: 'github_events#create'
end
