Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: "users/sessions",
    registrations: "users/registrations"
  }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end

  get 'users/:id/profile', to: 'users#show', as: 'user_profile'

  root to: "companies#index"
  get 'companies/search'
  resources :users, only: [:show]
  resources :companies do
    resources :rooms, only: [:new, :create]
  end
end
