Rails.application.routes.draw do
  devise_for :users, defaults: { format: :json }
  
  # GET '/'
  root to: 'api/v1/robots#index', defaults: { format: :json }
  
  #API definition
  namespace :api, defaults: { format: :json } do
  namespace :v1 do
  #List of resources:
    resources :users, :only => [:show]
    resources :robots, only: [ :index, :show, :update, :create, :destroy, :results ] do
      resources :weapons, only: [:show, :update, :create, :destroy ]
      resources :armors, only: [:show, :update, :create, :destroy ]
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
