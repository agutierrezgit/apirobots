Rails.application.routes.draw do
      
    namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :sessions, only: [:create, :destroy]
      resources :robots, only: [ :index, :show, :update, :create, :destroy, :results ] do
        resources :weapons, only: [:show, :update, :create, :destroy ]
        resources :armors, only: [:show, :update, :create, :destroy ]
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
