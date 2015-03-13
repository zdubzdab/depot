Depot::Application.routes.draw do
  get "persons/profile", as: 'user_root'
  devise_for :users
  resources :orders

  resources :line_items

  resources :carts

  get "store/index"
  resources :products 
    match 'persons/profile', to: 'persons#profile', via:  [:post, :get]

  root to: 'welcome#index'
end
