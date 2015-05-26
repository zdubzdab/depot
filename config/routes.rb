Depot::Application.routes.draw do
  get "admin/index"
  get "store/index"
  get "persons/profile", as: 'user_root'
  match 'persons/profile', to: 'persons#profile', via:  [:post, :get]

  devise_for :users
  resources :orders 

  resources 'line_items' do
    collection do
      get 'fresh'
    end
  end
  resources :carts

  resources :products 

  root to: 'welcome#index'
end
