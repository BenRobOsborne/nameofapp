Rails.application.routes.draw do
  get 'order_items/create'
  get 'order_items/update'
  get 'order_items/destroy'
  get 'carts/show'
  devise_for :users, path: '', path_names: { sign_in: 'login', sign_out: 'logout' }, controllers: { registrations: "user_registrations" }

  resources :products do
    collection do
      get 'search'
    end
    resources :comments
  end

  resources :users
  resources :products, only: [:index]
  resource :cart, only: [:show]
  resources :order_items, only: [:show, :create, :update, :destroy], defaults:{format:'js'}
  resources :orders,only: [:index, :show, :create, :destroy]

  get 'simple_pages/about'
  get 'simple_pages/contact'
  get 'simple_pages/index'
  root 'simple_pages#landing_page'
  get 'simple_pages/index'
  post 'simple_pages/thank_you'
  post 'payments/create'

  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
