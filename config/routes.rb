Rails.application.routes.draw do
  scope path: ApplicationResource.endpoint_namespace, defaults: { format: :jsonapi } do
    scope module: 'api/v1', as: 'api' do
      resources :users

    end
    mount VandalUi::Engine, at: '/vandal'
    # your routes go here
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "projects#index"
  resources :erd_urls
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
