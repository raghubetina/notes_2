Rails.application.routes.draw do
  resources :controls
  resources :events
  resources :calculations
  resources :api_integrations
  resources :scheduled_tasks
  resources :state_machines
  resources :callbacks
  resources :screens
  resources :user_stories
  resources :projects
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
