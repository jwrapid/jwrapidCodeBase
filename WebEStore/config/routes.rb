Estore::Application.routes.draw do
  resources :orders do
    put 'delivered', on: :member
  end


  resources :line_items do
    put 'decrease', on: :member
    put 'increase', on: :member
  end


  resources :carts

  resources :products do
    post 'order', on: :member
    member { post :vote }
  end

  resources :categories

  resources :searches

  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  root to: 'pages#home'

  match '/signup', to: 'users#new'
  match '/api/products', to: 'products#index', defaults: {format: :json}
  match '/api/products/:id', to: 'products#show', defaults: {format: :json}
  match '/api/products/:id/order', to: 'products#order', defaults: {format: :json}
  match '/api/orders/:id', to: 'orders#show', defaults: {format: :json}
  match '/paid', to: 'orders#paid'
  match '/admin',    to: 'pages#admin'
  match '/help',    to: 'pages#help'
  match '/about',   to: 'pages#about'
  match '/contact', to: 'pages#contact'
  match '/signup',  to: 'users#new'
  match '/signin',  to: 'sessions#new'
  match '/signout', to: 'sessions#destroy', via: :delete

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
