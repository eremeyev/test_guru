Rails.application.routes.draw do

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'about/author', to: 'application#author'
  get 'about', to: 'application#about'

  resources :tests, shallow: true, only: :index do
    member do
      post :start
    end
  end
  
  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end
  
  namespace :admin do
    resources :tests do
      resources :questions, shallow: true, only: %i[index new create edit show update destroy] do
        resources :answers, shallow: true, only: %i[index new create edit show update destroy]
      end
    end
  end
  
  root to: 'application#about'
   
end
