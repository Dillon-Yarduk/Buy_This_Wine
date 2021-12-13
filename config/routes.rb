Rails.application.routes.draw do
  devise_for :views
  devise_for :customers
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
  resources :cart, only: %i[create update destroy]
  # scope "/checkout" do
  #   post "create" to: "checkout#create", as: "checkout_create"
  #   get "success" to: "checkout#success", as: "checkout_success"
  #   get "cancel" to: "checkout#cancel", as: "checkout_cancel"
  # end
  root to: "wines#index"
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
