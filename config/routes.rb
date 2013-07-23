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

  # put '/routes/:id/checkin', :to => 'routes#check_in'
  resources :drivers


  resources :routes do
    member do
      put 'check_in'
      get 'check_in'
    end
  end



  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users, :controllers => { :registrations => 'registrations' } 
  resources :users
end