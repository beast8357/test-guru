Rails.application.routes.draw do

  root to: "tests#index"

  devise_for :users, path: :gurus, path_names: { sign_up: :login, sign_out: :logout }

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
    end
  end

end
