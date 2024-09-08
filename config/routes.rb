Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root 'home#index'
  resources :posts do
    member do
      defaults likeable_type: 'Post' do
        post 'like', to: 'likes#create'
        delete 'unlike', to: 'likes#destroy'
      end

      resources :comments, shallow: true do
        member do
          defaults likeable_type: 'Comment' do
            post 'like', to: 'likes#create'
            delete 'unlike', to: 'likes#destroy'
          end
        end
      end
    end
  end

  resources :users, only: %i[index show update], shallow: true do
    member do
      post 'follow', to: 'follows#create'
      delete 'unfollow', to: 'follows#destroy'
      resources :profiles, only: %i[show edit update]
    end
  end
end
