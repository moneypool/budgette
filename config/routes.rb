Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :groups, only: [:show, :new, :create]

  resources :users, only: [:show] do
    resources :goals, only: [:new, :show, :create, :update]
  end
end
