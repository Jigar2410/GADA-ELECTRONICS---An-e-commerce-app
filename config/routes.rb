Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :items
  resources :users
  resources :orders, except: [:create]
  resources :carts, except: [:new, :create]
  resources :cart_items
  #session paths
  get '/', to: 'sessions#index', as: 'root'
  get '/login', to: 'sessions#new', as:'login'
  post '/', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get 'signup', to: 'users#new', as: 'signup'
  post '/signup', to: 'users#create'

  #cart paths
  post '/add_to_cart', to: 'carts#add_to_cart', as: 'add_to_cart'
  get '/new_order_item', to: 'order_items#create', as: 'new_order_item'
  get '/create_order', to: 'orders#create', as: 'create_order'
  # Defines the root path route ("/")
  # root "articles#index"
end
