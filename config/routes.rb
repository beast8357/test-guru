Rails.application.routes.draw do

  root to: "tests#index"

  resources :tests do
    resources :questions do
      resources :answers
    end
  end

  resources :test_passages, only: %i[ show update ] do
    member do
      get :result
    end
  end

end
