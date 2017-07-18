Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace 'admin' do
    resources :sessions, only: [:new, :create, :destroy]
    get 'login', to: 'sessions#new', as: :login
    get 'logout', to: 'sessions#destroy', as: :logout
    root 'dashboard#index'
    resources :posts
    get "show_month", to: "days#show_month"
    get "month_up", to: "days#month_up"
    get "month_down", to: "days#month_down"
    resources :days
    resources :gratifications
    resources :greetings

    resources :push_notifications
    get "send_out_push_notification", to: "push_notifications#send_out"

  end

  namespace :api do
  ##POC routes no sessions
    namespace :v1 do
      resources :posts, only: [:index]
      resources :greetings, only: [:index]
      post "push_token", to: "tokens#create"
    end
  end
end
