Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  resources :groups, only: [:index, :new, :create, :destroy] do
   resources :transfers, only: [:index, :new, :create, :show, :destroy] 
  end
  # Defines the root path route ("/")
  
  devise_scope :user do
    authenticated :user do
      root "groups#index", as: :authenticated_root
    end
    unauthenticated :user do
      root "home#index", as: :unauthenticated_root
    end
  end
end
