Rails.application.routes.draw do
  get "errors/not_found", to: "errors#not_found"
  devise_for :users
  get "pages/index"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"

  root "pages#index"
  get '/dashboard', to: "pages#index"

  resources :categories do
    resources :tasks, except: [:index]
  end

  post '/delete_category/:id', to: "categories#destroy", as: :delete_category
  post '/delete_task/:category_id/:id', to: "tasks#destroy", as: :delete_task

  match "*unmatched", to: "errors#not_found", via: :all

  
end
