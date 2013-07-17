HitchhikerFrontend::Application.routes.draw do
  resources :vehicles


  resources :hitchhikers, only: [:index, :new, :create, :edit]
  get 'hitchhiker/show/:id', to: 'hitchhikers#show'
  get 'hitchhikers/update_models', :as => 'update_models'
  get 'hitchhikers/update_years', :as => 'update_years'

  resources :drivers


  resources :routes


  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end