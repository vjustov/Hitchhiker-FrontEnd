FinalProject::Application.routes.draw do
  get "drivers/new"

  get "drivers/create"

  get "drivers/show"

  get "drivers/edit"

  get "drivers/update"

  get "drivers/destroy"

  get "drivers/index"

  root :to => "route#index"
  resources :users, :only => [:index, :show, :edit, :update ]
  resources :drivers
  match '/auth/:provider/callback' => 'sessions#create'
  match '/signin' => 'sessions#new', :as => :signin
  match '/signout' => 'sessions#destroy', :as => :signout
  match '/auth/failure' => 'sessions#failure'
end
