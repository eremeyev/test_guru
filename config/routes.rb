Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'about/author', to: 'application#author'
  get 'about', to: 'application#about'

  resources :tests do
    resources :questions, shallow: true, only: %i[index new create edit show update destroy] do 
      resources :answers, shallow: true, only: %i[index new create edit show update destroy]
    end
    
    member do
      post :start
    end
  end
  
  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end
  
  root to: 'tests#index'
   
end