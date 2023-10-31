Rails.application.routes.draw do

  root to: "tests#index"

  devise_for :users, path: :gurus,
                     path_names: { sign_in: :login, sign_out: :logout },
                     controllers: { sessions: 'users/sessions' }

  resources :tests do
    resources :questions do
      resources :answers
    end

    member do
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :tests do
      patch :update_inline, on: :member

      resources :questions, except: :index do
        resources :answers, except: :index
      end
    end

    resources :gists, only: :index
  end

  resource :gist, only: :create

  resources :feedbacks, only: %i[new create]

end
