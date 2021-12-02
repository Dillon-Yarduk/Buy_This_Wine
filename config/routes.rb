Rails.application.routes.draw do
  get 'regions/index'
  get 'regions/show'
  get 'wineries/index'
  get 'wineries/show'
  get 'varieties/index'
  get 'varieties/show'
  resources :wines, only: %i[index show] do
    collection do
      get "search"
    end
  end
  resources :wineries, only: %i[index show]
  resources :varieties, only: %i[index show]
  resources :regions, only: %i[index show]
  resources :cart, only: %i[create destroy]
  root to: "wines#index"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
