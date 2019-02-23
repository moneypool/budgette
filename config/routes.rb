Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show] do
    scope module: :users do
      resources :goals, only: [:new, :show, :create, :update]
    end
  end
end
