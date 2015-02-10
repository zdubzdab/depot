Depot::Application.routes.draw do
  devise_for :users
  resources :orders

  resources :line_items

  resources :carts

  get "store/index"
  resources :products

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  root to: 'store#index', as: 'store'

end
