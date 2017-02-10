Rails.application.routes.draw do
  namespace :api, constraints: { format: "json" } do 
    namespace :v1 do 
      post "/login", to: "sessions#create"
      
      resources :users, only: :create
      resources :menus, only: :create do
        collection do 
          get :current_menu
        end
      end
    end
  end
end
