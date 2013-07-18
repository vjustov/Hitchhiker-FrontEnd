HitchhikerFrontend::Application.routes.draw do
  resources :vehicles


  resources :hitchhikers, only: [:index, :new, :edit]
  post 'hitchhikers/:id/edit', to: 'hitchhikers#edit'
  post 'hitchhikers/create', to: 'hitchhikers#create'
  get 'hitchhiker/show/:id', to: 'hitchhikers#show'
  get 'hitchhikers/update_models', :as => 'update_models'
  get 'hitchhikers/update_years', :as => 'update_years'
  get 'hitchhikers/add_vehicles', :as => 'add_vehicles'
  get 'hitchhikers/remove_vehicles', :as => 'remove_vehicles'

  resources :drivers


  resources :routes


  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end