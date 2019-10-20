Rails.application.routes.draw do
  get 'sessions/new'
  get 'users/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'about/author', to: 'application#author'
  get 'about', to: 'application#about'

  get :signup, to: 'users#new'
  get :login, to: 'sessions#new'
  get :logout, to: 'sessions#destroy'
  
  resources :sessions, only: :create
  
  resources :users, only: :create do
    resources :tests, shallow: true do
      resources :questions, shallow: true, only: %i[index new create edit show update destroy] do
        resources :answers, shallow: true, only: %i[index new create edit show update destroy]
      end

      member do
        post :start
      end
    end
  end
  
  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end
  
  root to: 'application#about'
   
end
