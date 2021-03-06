Rails.application.routes.draw do
  # get 'logins/new'
  #
  # get 'logins/create'
  #
  # get 'logins/destroy'

	get '/login/show/:id', to: 'logins#show', as: 'login_show'
  #
  # get 'users/index'
  #
  # get 'users/new'
  #
  # get 'users/show'
  #
  # get 'users/create'
  #
  # get 'notes/new'
  #
  # get 'notes/create'
  #
  # get 'notes/chosen'

	get 'problems/index'

  resources :problems do
	  resources :notes, :shallow => true
  end

  resources :users, :only => [:new, :create]
  resource :login, :only => [:new, :create, :destroy, :show]

	get 'users/activate/:activation_key' => 'users#activate', as: :activate_user
	patch 'users/activate' => 'users#update'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'problems#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
