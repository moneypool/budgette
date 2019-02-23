Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: :registrations }

  resources :users, only: [:show] do
    resources :bank_accounts, only: [:new, :create]
    resources :goals, only: [:new, :create]
  end

  resources :groups, only: [:index, :show, :new, :create] do
    resources :acceptances, only: [:new]
    resource :invitation, only: [:show]
  end

  resources :api_callbacks, only: :new
end
