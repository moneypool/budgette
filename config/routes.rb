Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:show] do
    resources :goals, only: [:new, :show, :create, :update]
  end

  resources :groups, only: [:show, :new, :create] do
    resources :acceptances, only: [:new]
    resource :invitation, only: [:show]
  end
end
