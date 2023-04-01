Rails.application.routes.draw do

  root to: "tests#index"

  resources :tests do
    resources :questions do
      resources :answers
    end
  end

end
