HitchhikerFrontend::Application.routes.draw do
  resources :vehicles


  resources :hitchhikers, only: [:index, :new, :edit, :show]
  # post 'hitchhikers/:id/edit', to: 'hitchhikers#edit'
  # post 'hitchhikers/create', to: 'hitchhikers#create'
  # get 'hitchhiker/show/:id', to: 'hitchhikers#show'
  get 'hitchhikers/update_models', :as => 'update_models'
  get 'hitchhikers/update_years', :as => 'update_years'
  get 'hitchhikers/add_vehicles', :as => 'add_vehicles'
  get 'hitchhikers/remove_vehicles', :as => 'remove_vehicles'
  get 'users/sign_up/step2', to: 'users#step2', :as => 'step2'

  # put '/routes/:id/checkin', :to => 'routes#check_in'
  resources :drivers


  resources :routes do
    member do
      get 'check_in'
    end
  end



  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users, :controllers => { :registrations => 'registrations', :omniauth_callbacks => 'omniauth_callbacks' } 
  resources :users

  post 'users/sign_up/step2', to: 'registrations#create', :as => 'new_user_registration_step2'
end