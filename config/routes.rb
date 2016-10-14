Rails.application.routes.draw do
  get 'github_repository/dashboard'

  get 'home/index'

  devise_for :users

  concern :dashboard do
    get :dashboard, on: :member
  end

  resources :accounts, concerns: [:dashboard]
  resources :test_result_items
  resources :test_results, concerns: [:dashboard]
  resources :github_branches, concerns: [:dashboard]
  resources :github_repository, only: [], concerns: [:dashboard]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'
  post 'github_event', to: 'github_events#create'
end
