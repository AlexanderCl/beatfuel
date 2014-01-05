Beatfuel::Application.routes.draw do
  resources :upload
  resources :uploadimage
  resources :admins do
    collection do
      get 'mixtapes'
      get 'images'
    end
  end

  resources :users do
    collection do
      get 'regio'
    end
  end

  resources :adminsimg

  resources :userimg

  resources :recommendations

  get "pages/home"
  root 'pages#home'

  get 'auth/:provider/callback' => 'sessions#create'
  get 'auth/failure' => redirect('/')
  get 'signout' => 'sessions#destroy', as: 'signout'



  #get "admins/index"
  #get "admins/mixtapes"
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
