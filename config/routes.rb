Rails.application.routes.draw do
  devise_for :users
  get 'companies/index'
  root to: "companies#index"
end
