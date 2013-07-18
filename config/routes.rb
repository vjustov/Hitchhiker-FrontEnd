HitchhikerFrontend::Application.routes.draw do
  resources :vehicles


  resources :hitchhikers, only: [:index, :new, :create, :edit]
  get 'hitchhiker/show/:id', to: 'hitchhikers#show'
  get 'hitchhikers/update_models', :as => 'update_models'
  get 'hitchhikers/update_years', :as => 'update_years'

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
  devise_for :users
  resources :users
end