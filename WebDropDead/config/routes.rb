Rails.application.routes.draw do

  root 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users, only: [:show, :new, :create] do
    resources :games, only: [:new, :create, :show] do
      post :repeat, on: :member
    end
    resources :game_histories, only: [:index, :show, :create] do
      collection do
        post :select_game
      end
    end  
  end

  resource :session, only: [:new, :create, :destroy]
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
